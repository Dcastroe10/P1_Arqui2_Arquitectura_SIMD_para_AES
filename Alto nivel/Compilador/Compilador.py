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
                line = line.strip()
                if line:
                    clear_code.append(line)
            
            instructions.extend(clear_code)
            get_labels()
            print("Archivo cargado con éxito.")
            machine_code = ""
            mem_dir = 0

            for instruction in instructions:
                binary_instruction = ""
                result = parse_instruction(instruction.upper(), labels)
                if result:
                    opcode, operands = result
                    binary_opcode = get_opcode(opcode)
                    binary_operands = get_operands(operands)
                    binary_instruction = binary_opcode + binary_operands
                    if len(binary_instruction) < 16:
                        binary_instruction = binary_instruction.ljust(16, '0')
                
                    machine_code += str(mem_dir) + ": " + binary_instruction + "\n"
                    mem_dir += 1
                
                else:
                    global compiler_error
                    compiler_error = True
                    print("Formato de instruccion no valido: ", instruction)

            file.close()

            if not compiler_error:
                with open(output, 'w') as out:
                    out.write("WIDTH=8;\nDEPTH=1023;\n\nADDRESS_RADIX=DEC;\nDATA_RADIX=BIN;\n\nCONTENT BEGIN\n")
                    out.write(machine_code + "[" + str(mem_dir) + "..1023]:" + nop + ";\n")
                    out.write("END;")
                    out.close()
                    machine_code = ""

def parse_instruction(instruction, lables):
    # Expresion regular para operaciones aritmeticas
    arithmetic_regex = r'(\b(?:MIX|SUBS)\b)\s+((?:V|R)\d+),\s*((?:V|R)\d+),\s*((?:V|R)\d+)'

    # Expresion regular para instrucciones de salto
    branch_regex = r'(\b(?:B)\b)\s+([^\s]+)'

    # Expresion regular para las operaciones logicas
    logic_regex = r'(\b(?:LSH|XOR)\b)\s+((?:V|R)\d+),\s*((?:V|R)\d+),\s*((?:V|R)\d+)'

    # Expresion regular para datos
    data_regex = r'(\b(?:STR|LDR)\b)\s+((?:V|R)\d+)\[(R\d+)\]'

    match = re.match(arithmetic_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        return opcode, operands
    
    match = re.match(branch_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        return opcode, operands
    
    match = re.match(logic_regex, instruction)
    if match:
        opcode = match.group(1)
        operands = match.groups()[1:]
        return opcode, operands
    
    match = re.match(data_regex, instruction)
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
        return "1111"
    
    if opcode == "SUBS":
        return "1110"
    
    if opcode == "LSH":
        return "1101"
    
    if opcode == "XOR":
        return "1100"
    
    if opcode == "LDR":
        return "1011"
    
    if opcode == "STR":
        return "1010"
    
    if opcode == "B":
        return "1001"
    global compiler_error
    compiler_error = True
    return "0000"

def get_operands(operands):
    if len(operands) == 1:
        for op in operands:
            branch = get_branch(op)
            if branch:
                return branch
            else:
                print("La etiqueta " + op + " no existe")
                global compiler_error
                compiler_error = True
                return 12 * '0'
    else:
        binary_operands = ""
        for op in operands:
            type = ""
            if op.startswith('R'):
                type = "0"
            else:
                type = "1"
            
            bin_op = bin(int(op[1:]))[2:].zfill(3)
            binary_operands += type + bin_op
        return binary_operands

def get_branch(label):
    for i in labels:
        if label == i[0]:
            binary_branch = format(i[1], '012b')
            return binary_branch
    return False

root = tk.Tk()
root.title("Compilador")

compiler_error = False
instructions = []
labels = []
nop = 16 * '0'

open_button = tk.Button(root, text="Seleccionar archivo", command=open_file_dialog)
open_button.pack(padx=10, pady=10)

root.mainloop()