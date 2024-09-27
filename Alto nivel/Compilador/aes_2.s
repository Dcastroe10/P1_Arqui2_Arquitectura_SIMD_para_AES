carga_datos:
movr r1, #0
movr r2, #8
movr r3, #1
movr r4, #0
movr r5, #10

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

aes:
xor v4, v0, v4
xor v5, v0, v5
xor v6, v0, v6
xor v7, v0, v7

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
nop
write_col v4, v10, #1
write_col v4, v11, #2
write_col v4, v12, #3

read_col v8, v0, #3
clsh v8, v8, #1
subs v8, v8
rcon v9, r4
xor v8, v8, v9

read_col v9, v0, #0
xor v9, v8, v9

read_col v8, v0, #1
xor v10, v9, v8

read_col v8, v0, #2
xor v11, v10, v8

read_col v8, v0, #3
xor v12, v11, v8

vstr v9[r1]
add r1, r1, r3

vstr v10[r1]
add r1, r1, r3

vstr v11[r1]
add r1, r1, r3

vstr v12[r1]
add r1, r1, r3

add r4, r4, r3
beq r4, r5, end
b aes

end: