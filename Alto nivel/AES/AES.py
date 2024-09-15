import numpy as np

INPUT= "4c6f206c6f6772616d6f732053495521" #Lo logramos SIU!

KEY = "45737461206573206c61206c6c617665" #Esta es la llave

sbox = [
    0x63, 0x7c, 0x77, 0x7b, 0xf2, 0x6b, 0x6f, 0xc5,
    0x30, 0x01, 0x67, 0x2b, 0xfe, 0xd7, 0xab, 0x76,
    0xca, 0x82, 0xc9, 0x7d, 0xfa, 0x59, 0x47, 0xf0,
    0xad, 0xd4, 0xa2, 0xaf, 0x9c, 0xa4, 0x72, 0xc0,
    0xb7, 0xfd, 0x93, 0x26, 0x36, 0x3f, 0xf7, 0xcc,
    0x34, 0xa5, 0xe5, 0xf1, 0x71, 0xd8, 0x31, 0x15,
    0x04, 0xc7, 0x23, 0xc3, 0x18, 0x96, 0x05, 0x9a,
    0x07, 0x12, 0x80, 0xe2, 0xeb, 0x27, 0xb2, 0x75,
    0x09, 0x83, 0x2c, 0x1a, 0x1b, 0x6e, 0x5a, 0xa0,
    0x52, 0x3b, 0xd6, 0xb3, 0x29, 0xe3, 0x2f, 0x84,
    0x53, 0xd1, 0x00, 0xed, 0x20, 0xfc, 0xb1, 0x5b,
    0x6a, 0xcb, 0xbe, 0x39, 0x4a, 0x4c, 0x58, 0xcf,
    0xd0, 0xef, 0xaa, 0xfb, 0x43, 0x4d, 0x33, 0x85,
    0x45, 0xf9, 0x02, 0x7f, 0x50, 0x3c, 0x9f, 0xa8,
    0x51, 0xa3, 0x40, 0x8f, 0x92, 0x9d, 0x38, 0xf5,
    0xbc, 0xb6, 0xda, 0x21, 0x10, 0xff, 0xf3, 0xd2,
    0xcd, 0x0c, 0x13, 0xec, 0x5f, 0x97, 0x44, 0x17,
    0xc4, 0xa7, 0x7e, 0x3d, 0x64, 0x5d, 0x19, 0x73,
    0x60, 0x81, 0x4f, 0xdc, 0x22, 0x2a, 0x90, 0x88,
    0x46, 0xee, 0xb8, 0x14, 0xde, 0x5e, 0x0b, 0xdb,
    0xe0, 0x32, 0x3a, 0x0a, 0x49, 0x06, 0x24, 0x5c,
    0xc2, 0xd3, 0xac, 0x62, 0x91, 0x95, 0xe4, 0x79,
    0xe7, 0xc8, 0x37, 0x6d, 0x8d, 0xd5, 0x4e, 0xa9,
    0x6c, 0x56, 0xf4, 0xea, 0x65, 0x7a, 0xae, 0x08,
    0xba, 0x78, 0x25, 0x2e, 0x1c, 0xa6, 0xb4, 0xc6,
    0xe8, 0xdd, 0x74, 0x1f, 0x4b, 0xbd, 0x8b, 0x8a,
    0x70, 0x3e, 0xb5, 0x66, 0x48, 0x03, 0xf6, 0x0e,
    0x61, 0x35, 0x57, 0xb9, 0x86, 0xc1, 0x1d, 0x9e,
    0xe1, 0xf8, 0x98, 0x11, 0x69, 0xd9, 0x8e, 0x94,
    0x9b, 0x1e, 0x87, 0xe9, 0xce, 0x55, 0x28, 0xdf,
    0x8c, 0xa1, 0x89, 0x0d, 0xbf, 0xe6, 0x42, 0x68,
    0x41, 0x99, 0x2d, 0x0f, 0xb0, 0x54, 0xbb, 0x16
]

rcon = [
    0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36
]

def sub_word(word):
    """Aplica la S-box a cada byte de la palabra (4 bytes)"""
    return [sbox[b] for b in word]

def rot_word(word):
    """Rota los bytes de la palabra hacia la izquierda"""
    return word[1:] + word[:1]

def key_expansion(key):
    """Expande la clave inicial para generar las 11 subllaves (AES-128)"""
    key_symbols = [int(key[i:i+2], 16) for i in range(0, len(key), 2)]
    
    # Matriz que contendrá todas las subclaves (44 palabras, 4 bytes cada una)
    key_schedule = np.zeros((44, 4), dtype=np.uint8)
    
    # Copiar la clave inicial en las primeras 4 palabras
    for i in range(4):
        key_schedule[i] = key_symbols[4*i:4*(i+1)]
    
    # Generar las palabras restantes
    for i in range(4, 44):
        temp = np.array(key_schedule[i - 1].copy(), dtype=np.uint8)  # Convertir a array de NumPy
        
        # Cada 4 palabras, aplicar RotWord, SubWord y Rcon
        if i % 4 == 0:
            temp = np.array(sub_word(rot_word(temp.tolist())), dtype=np.uint8)  # Convertir a lista antes de la rotación
            temp[0] ^= rcon[(i // 4) - 1]  # Aplica el Rcon solo al primer byte
        
        # Comprobar el tamaño de temp
        assert temp.shape == (4,), f"Shape mismatch: {temp.shape}"
        
        # XOR entre la palabra anterior y la palabra 4 posiciones atrás
        key_schedule[i] = np.bitwise_xor(key_schedule[i - 4], temp)
    
    return key_schedule

def print_subkeys(key_schedule):
    """Imprime las subclaves generadas en formato hexadecimal"""
    for i in range(0, 44, 4):
        print(f"Subclave {i//4}:")
        for j in range(4):
            print(" ".join([f"{byte:02x}" for byte in key_schedule[i + j]]))
        print()

def hex_to_matrix(hex_string):
    byte_array = bytes.fromhex(hex_string)
    matrix = np.frombuffer(byte_array, dtype=np.uint8).reshape((4, 4), order='F')
    return matrix

def xor_matrices(matrix1, matrix2):
    return np.bitwise_xor(matrix1, matrix2)

def shift_rows(matrix):
    shifted_matrix = np.copy(matrix)
    shifted_matrix[1] = np.roll(matrix[1], -1)
    shifted_matrix[2] = np.roll(matrix[2], -2)
    shifted_matrix[3] = np.roll(matrix[3], -3)
    return shifted_matrix

def substitute_bytes(matrix):
    substituted_matrix = np.empty_like(matrix)
    for i in range(4):
        for j in range(4):
            substituted_matrix[i, j] = sbox[matrix[i, j]]
    return substituted_matrix

def mix_columns(matrix):
    # Coeficientes de la multiplicación
    mix_matrix = np.array([[0x02, 0x03, 0x01, 0x01],
                            [0x01, 0x02, 0x03, 0x01],
                            [0x01, 0x01, 0x02, 0x03],
                            [0x03, 0x01, 0x01, 0x02]], dtype=np.uint8)

    # Resultado de MixColumns
    mixed_matrix = np.zeros_like(matrix)

    # Realizar la multiplicación de matrices en el campo GF(2^8)
    for c in range(4):
        mixed_matrix[:, c] = [
            gf_mult(matrix[0, c], mix_matrix[0, 0]) ^ 
            gf_mult(matrix[1, c], mix_matrix[0, 1]) ^ 
            gf_mult(matrix[2, c], mix_matrix[0, 2]) ^ 
            gf_mult(matrix[3, c], mix_matrix[0, 3]),
            gf_mult(matrix[0, c], mix_matrix[1, 0]) ^ 
            gf_mult(matrix[1, c], mix_matrix[1, 1]) ^ 
            gf_mult(matrix[2, c], mix_matrix[1, 2]) ^ 
            gf_mult(matrix[3, c], mix_matrix[1, 3]),
            gf_mult(matrix[0, c], mix_matrix[2, 0]) ^ 
            gf_mult(matrix[1, c], mix_matrix[2, 1]) ^ 
            gf_mult(matrix[2, c], mix_matrix[2, 2]) ^ 
            gf_mult(matrix[3, c], mix_matrix[2, 3]),
            gf_mult(matrix[0, c], mix_matrix[3, 0]) ^ 
            gf_mult(matrix[1, c], mix_matrix[3, 1]) ^ 
            gf_mult(matrix[2, c], mix_matrix[3, 2]) ^ 
            gf_mult(matrix[3, c], mix_matrix[3, 3])
        ]

    return mixed_matrix

def gf_mult(a, b):
    """Multiplicación en el campo GF(2^8)"""
    p = 0
    for _ in range(8):
        if (b & 1) == 1:
            p ^= a
        hi_bit_set = (a & 0x80) != 0
        a <<= 1
        if hi_bit_set:
            a ^= 0x1b  # 0x1b es el polinomio irreducible
        b >>= 1
    return p % 256

def AES():

    input_matrix = hex_to_matrix(INPUT)
    key_matrix = hex_to_matrix(KEY)

    matrix = xor_matrices(input_matrix, key_matrix)
    print("XOR Matrix:\n", matrix)

    for round in range(1,10):
        print(f"ESTE ES EL ROUND {round}")
        matrix = substitute_bytes(matrix)
        print("Substituted Matrix:\n", matrix)
        matrix = shift_rows(matrix)
        print("Substituted Matrix:\n", matrix)
        matrix = mix_columns(matrix)
        print("Mixed Columns Matrix:\n", matrix)

        round_key = hex_to_matrix(round_keys[round])
        matrix = xor_matrices(matrix, round_key)
        print("AddRoundKey Matrix:\n", matrix)
    
    print("FINAL ROUND")
    matrix = substitute_bytes(matrix)
    print("Substituted Matrix:\n", matrix)
    matrix = shift_rows(matrix)
    print("Substituted Matrix:\n", matrix)
    round_key = hex_to_matrix(round_keys[10])
    matrix = xor_matrices(matrix, round_key)
    print("FINAL Matrix:\n", matrix)

    return matrix

# Expansión de la clave
key_schedule = key_expansion(KEY)

round_keys = []

for i in range(0,44, 4):
    round_keys.append(bytes(key_schedule[i]).hex()+ bytes(key_schedule[i+1]).hex() + bytes(key_schedule[i+2]).hex() + bytes(key_schedule[i+3]).hex())

print(round_keys)

result = AES()
