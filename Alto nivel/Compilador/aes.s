; Codigo alternativo
; Key gen -> aes -> final round -> guardado

movr r1, #0
movr r2, #8
movr r3, #1

; Carga de la llave en v0, v1, v2, v3
vldr v0[r1]
add r1, r1, r3

vldr v1[r1]
add r1, r1, r3

vldr v2[r1]
add r1, r1, r3

vldr v3[r1]
add r1, r1, r3

movr r4, #0      ; Contador
movr r5, #10     ; Final del loop

key_expansion:
read_col v4, v0, #3
clsh v4, v4, #1
subs v4, v4
rcon v8, r4
xor v4, v4, v8

read_col v5, v0, #0
xor v5, v4, v5

read_col v4, v0, #1
xor v6, v4, v5

read_col v4, v0, #2
xor v7, v4, v6

read_col v4, v0, #3
xor v8, v4, v7

write_col v0, v5, #0
write_col v0, v6, #1
write_col v0, v7, #2
write_col v0, v8, #3

vstr v0[r2]
add r2, r2, r3

vstr v1[r2]
add r2, r2, r3

vstr v2[r2]
add r2, r2, r3

vstr v3[r2]
add r2, r2, r3

add r4, r4, r3
beq r4, r5, aes_first_round
b key_expansion

aes_first_round:
movr r1, #0
movr r4, #0
movr r5, #9

vldr v0[r1]
add r1, r1, r3

vldr v1[r1]
add r1, r1, r3

vldr v2[r1]
add r1, r1, r3

vldr v3[r1]
add r1, r1, r3

vldr v4[r1]
add r1, r1, r3

vldr v5[r1]
add r1, r1, r3

vldr v6[r1]
add r1, r1, r3

vldr v7[r1]
add r1, r1, r3

xor v4, v0, v4
xor v5, v1, v5
xor v6, v2, v6
xor v7, v3, v7

aes_main:
subs v4, v4
subs v5, v5
subs v6, v6
subs v7, v7

clsh v5, v5, #1
clsh v6, v6, #2
clsh v7, v7, #3

read_col v8, v4, #0
mix v9, v8

read_col v8, v4, #1
mix v10, v8

read_col v8, v4, #2
mix v11, v8

read_col v8, v4, #3
mix v12, v8

write_col v4, v9, #0
write_col v4, v10, #1
write_col v4, v11, #2
write_col v4, v12, #3

vldr v0[r1]
add r1, r1, r3

vldr v1[r1]
add r1, r1, r3

vldr v2[r1]
add r1, r1, r3

vldr v3[r1]
add r1, r1, r3

xor v4, v0, v4
xor v5, v1, v5
xor v6, v2, v6
xor v7, v3, v7

add r4, r4, r3
beq r4, r5, final_round
b aes_main

final_round:
subs v4, v4
subs v5, v5
subs v6, v6
subs v7, v7

clsh v5, v5, #1
clsh v6, v6, #2
clsh v7, v7, #3

write_col v4, v9, #0
write_col v4, v10, #1
write_col v4, v11, #2
write_col v4, v12, #3

vldr v0[r1]
add r1, r1, r3

vldr v1[r1]
add r1, r1, r3

vldr v2[r1]
add r1, r1, r3

vldr v3[r1]

xor v4, v0, v4
xor v5, v1, v5
xor v6, v2, v6
xor v7, v3, v7