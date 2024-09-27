import re
import os
import tkinter as tk
from tkinter import filedialog

def open_file_dialog():
    filepath = filedialog.askopenfilename(filetypes=[("Assembly files", "*.s")])
    output = os.path.splitext(os.path.basename(filepath))[0] + '.mif'
    if filepath:
        with open(filepath, 'r') as file:
            lines = file.readlines()
            clear_code = []
            for line in lines:
                line = line.split(';')[0].strip()
                if line:
                    clear_code.append(line)
            
            instructions.extend(clear_code)
            get_labels()
            print("Archivo cargado con éxito.")
            machine_code = ""
            hex_code = ""
            mem_dir = 0

            for instruction in instructions:
                binary_instruction = ""
                result = parse_instruction(instruction.upper(), labels)
                if result:
                    opcode, operands = result
                    binary_opcode = get_opcode(opcode)
                    binary_operands = get_operands(operands, opcode)
                    binary_instruction = binary_opcode + binary_operands
                    if len(binary_instruction) < 20:
                        binary_instruction = binary_instruction.ljust(20, '0')
                
                    machine_code += str(mem_dir) + ": " + binary_instruction + "\n"
                    hex_code += hex(int(binary_instruction,2))[2:] + "\n"
                    mem_dir += 1
                
                else:
                    global compiler_error
                    compiler_error = True
                    print("Formato de instruccion no valido: ", instruction)
            print(hex_code)
            file.close()
            print("Archivo compilado con éxito")

            if not compiler_error:
                with open(output, 'w') as out:
                    out.write("WIDTH=20;\nDEPTH=1023;\n\nADDRESS_RADIX=DEC;\nDATA_RADIX=BIN;\n\nCONTENT BEGIN\n")
                    out.write(machine_code + "[" + str(mem_dir) + "..1023]:" + nop + ";\n")
                    out.write("END;")
                    out.close()
                    machine_code = ""
                print("Archivo con instrucciones en binario creado con exito")

def parse_instruction(instruction, lables):
    # Expresion para NOPS
    nop_regex = r'(\b(?:NOP))\b'

    # Expresion regular para operaciones aritmeticas escalares
    arithmetic_scalar_regex = r'(\b(?:ADD)\b)\s+((?:R)\d+),\s*((?:R)\d+),\s*((?:V|R)\d+)'

    # Expresion regular para operaciones aritmeticas vectoriales
    arithmetic_vector_regex = r'(\b(?:MIX|SUBS)\b)\s+((?:V)\d+),\s*((?:V)\d+)\b'

    # Expresion regular para instrucciones de salto
    branch_eq_regex = r'\b(BEQ\b)\s+(R\d+),\s+(R\d+),\s+([^\s]+)\b'

    # Expresion regular para expresion de salto obligatorio
    branch_regex = r'(\b(?:B)\b)\s+([^\s]+)'

    # Expresion regular para las operaciones logicas
    xor_regex = r'(\b(?:XOR)\b)\s+((?:V|R)\d+),\s*((?:V|R)\d+),\s*((?:V|R)\d+)'

    # Expresion regular para logical shift left vectorial
    lshift_regex = r'(\b(?:CLSH)\b)\s+((?:V)\d+),\s*((?:V)\d+),\s+(#-?\d+)\b'

    # Expresion regular para datos escalares
    escalar_data_regex = r'(\b(?:STR|LDR)\b)\s+((?:V|R)\d+)\[(R\d+)\]'

    # Expresion regular para datos vectoriales
    vectorial_data_regex = r'(\b(?:VSTR|VLDR)\b)\s+((?:V|R)\d+)\[(R\d+)\]'

    # Expresion regular para rcon
    rcon_data_regex = r'(\b(?:RCON)\b)\s+((?:V)\d+),\s+((?:R)\d+)\b'

    # Expresion para mov de registro escalar
    movr_regex = r'\b(MOVR\b)\s+(R\d+),\s+(R\d+|#-?\d+)\b'

    # Expresion regular para lectura o escritura de columnas
    read_write_col_regex = r'(\b(?:READ_COL|WRITE_COL)\b)\s+((?:V)\d+),\s+((?:V)\d+),\s+(#-?\d+)\b'

    match = re.match(nop_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = ()
        return opcode, operands

    match = re.match(arithmetic_scalar_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        return opcode, operands
    
    match = re.match(arithmetic_vector_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        return opcode, operands
    
    match = re.match(branch_eq_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        return opcode, operands
    
    match = re.match(branch_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        return opcode, operands
    
    match = re.match(xor_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        return opcode, operands
    
    match = re.match(lshift_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        return opcode, operands
    
    match = re.match(escalar_data_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        operands_1 = []
        for op in operands:
            op = op.replace('[', '').replace(']', '')
            operands_1.append(op)
        return opcode, operands_1
    
    match = re.match(movr_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        return opcode, operands
    
    match = re.match(read_write_col_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        return opcode, operands
    
    match =re.match(rcon_data_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        return opcode, operands
    
    match = re.match(vectorial_data_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        operands_1 = []
        for op in operands:
            op = op.replace('[', '').replace(']', '')
            operands_1.append(op)
        return opcode, operands_1
       
    return False

def get_labels():
    for instruction in instructions:
        label = parse_label(instruction)
        if label:
            labels.append(label)

def parse_label(instruction):
    label_regex = r'^[^\s:]+:$'
    match = re.match(label_regex, instruction)
    if match:
        index = instructions.index(instruction)
        label = [instruction[:len(instruction) - 1].upper(), index]
        instructions.remove(instruction)
        return label
    return False

def get_opcode(opcode):
    if opcode == "MIX":
        return "11111"
    
    if opcode == "SUBS":
        return "11110"
    
    if opcode == "CLSH":
        return "11101"
    
    if opcode == "XOR":
        return "11100"
    
    if opcode == "LDR":
        return "11011"
    
    if opcode == "STR":
        return "11010"
    
    if opcode == "B":
        return "11001"
    
    if opcode == "MOVR":
        return "11000"
    
    if opcode == "VSTR":
        return "10111"
    
    if opcode == "VLDR":
        return "10110"
    
    if opcode == "ADD":
        return "10101"
    
    if opcode == "BEQ":
        return "10100"
    
    if opcode == "READ_COL":
        return "10011"
    
    if opcode == "WRITE_COL":
        return "10010"
    
    if opcode == "RCON":
        return "10001"
    
    if opcode == "NOP":
        return "00000"
    
    global compiler_error
    compiler_error = True
    print("El operador " + opcode + " no existe en el ISA")
    return "00000"

def get_operands(operands, opcode):
    if len(operands) == 0:
        return 15*"0"
    len_imma = 0
    if opcode == "CLSH":
        len_imma = 5
    
    if opcode == "MOVR":
        len_imma = 10

    if opcode == "READ_COL" or opcode == "WRITE_COL":
        len_imma = 4
    
    if len(operands) == 1:
        for op in operands:
            branch = get_branch(op)
            if branch:
                return '0'*10 + branch
            else:
                print("La etiqueta " + op + " no existe")
                global compiler_error
                compiler_error = True
                return 5 * '0'
    else:
        binary_operands = ""
        word = r'[A-Za-z_]*'
        for op in operands:
            match = re.fullmatch(word, op)
            if match:
                branch = get_branch(op)
                if branch:
                    binary_operands += branch
                    break
                else:
                    print("La etiqueta " + op + " no existe")
                    compiler_error = True
                    binary_operands += 5*'0'
                    break
            type = ""
            if op.startswith('R'):
                type = "0"
            else:
                type = "1"
            
            if op.startswith('#'):
                bin_op = bin(int(op[1:]))[2:].zfill(len_imma)
                if opcode == "READ_COL" or opcode == "WRITE_COL":
                    binary_operands += "1" + bin_op
                else:
                    binary_operands += bin_op
            else:
                bin_op = bin(int(op[1:]))[2:].zfill(4)
                binary_operands += type + bin_op
            
        return binary_operands

def get_branch(label):
    for i in labels:
        if label == i[0]:
            print(i)
            binary_branch = format(i[1], '05b')
            return binary_branch
    return False

root = tk.Tk()
root.title("Compilador")

compiler_error = False
instructions = []
labels = []
nop = 20 * '0'

open_button = tk.Button(root, text="Seleccionar archivo", command=open_file_dialog)
open_button.pack(padx=10, pady=10)

root.mainloop()