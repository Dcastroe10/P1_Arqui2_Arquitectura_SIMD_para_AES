; Falta agregar los ldrs para cargar los valores desde la RAM
; Falta agregar los valores iniciales de direccion para guardar
; V0, V1, V2 y V3 son la llave y V4, V5, V6 y V7 el texto a cifrar

aes:
xor v4, v0, v4              ; XOR entre la F1 de la llave y F1 del texto
xor v5, v0, v5          ; XOR entre la F2 de la llave y F2 del texto
xor v6, v0, v6          ; XOR entre la F3 de la llave y F3 del texto
xor v7, v0, v7          ; XOR entre la F4 de la llave y F3 del texto

subs v4, v4             ; sustitucion con la sbox en v4
subs v5, v5             ; sustitucion con la sbox en v5
subs v6, v6             ; sustitucion con la sbox en v6
subs v7, v7             ; sustitucion con la sbox en v7

clsh v5, v5, #1             ; desplazamiento circular a la sda fila
clsh v6, v6, #2             ; desplazamiento circular a la 3ra fila
clsh v7, v7, #3             ; desplazamiento circular a la 4ta fila

read_col v8, v4, #0     ; Lectura de la primera columna
mix v9, v8              ; Multiplicacion vectorial para la primera columna

read_col v8, v4, #1     ; Lectura de la segunda columna
mix v10, v8             ; Multiplicacion vectorial para la segunda columna

read_col v8, v4, #2     ; Lectura de la tercera columna
mix v11, v8             ; Multiplicacion vectorial para la tercera columna

read_col v8, v4, #3     ; Lectura de la 4ta columna
mix v12, v8             ; Multiplicacion vectorial para la 4ta columna

write_col v4, v9, #0    ; Escritura en la primera columna desde v4
write_col v4, v10, #1   ; Escritura en la 2da columna desde v4
write_col v4, v11, #2   ; Escritura en la 3ra columna desde v4
write_col v4, v12, #3   ; Escritura en la 4ta columna desde v4

key_expansion:
read_col v8, v0, #3
clsh v8, v8, #1
subs v8, v8
rcon v10, r3
xor v8, v8, v10

read_col v9, v0, #0
xor v9, v8, v9

read_col v8, v0, #1
xor v10, v9, v8

read_col v8, v0, #2
xor v11, v10, v8

read_col v8, v0, #3
xor v12, v11, v8

;vstr v9, r1
add r1, r1, r2

;vstr v10, r1
add r1, r1, r2

;vstr v11, r1
add r1, r1, r2

;vstr v12, r1
add r1, r1, r2