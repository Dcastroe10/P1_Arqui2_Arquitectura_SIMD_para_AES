; Falta la extension de la llave
; Se asume que la extension de la llave empieza en v2

start:

movr r0, #0     ; Instancia el inicio del loop
movr r1, #0     ; Direccion de memoria para cargar la llave
movr r2, #16    ; Direccion de memoria para cargar el texto
movr r3, #9     ; Fin del loop
movr r4, #1     ; Cantidad a sumar
vldr v0[r1]     ; Carga la llave en v0
vldr v1[r2]     ; Carga el texto en v1
b aes

aes:
xor v1, v1, v2              ; Aplica xor al texto con la llave (AddRoundKey)
subs v1, v2, v3             ; Aplica la operacion sub al texto (SubBytes)
lsh v1, v1                  ; Aplica la operacion shift al texto (ShiftRows)
mix v1, v1, v1              ; Aplica la operacion mix al texto (MixColumns)
beq r0, r3, final_round     ; Comparar si ya han ocurrido 9 loops
add r0, r0, r4              ; Sumar 1 a r0
b aes

final_round:
subs v1, v2, v3
lsh v1, v1, #2
xor v1, v1, v2
vstr v1[r2]