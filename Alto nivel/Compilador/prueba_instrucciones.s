movr r1, #0
movr r2, #1

vldr v0[r1]
add r1, r1, r2
vldr v1[r1]
add r1, r1, r2
vldr v2[r1]
add r1, r1, r2
vldr v3[r1]

read_col v4, v0, #0
write_col v0, v4, #3