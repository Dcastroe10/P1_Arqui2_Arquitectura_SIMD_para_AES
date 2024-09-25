def sbox_raw(input, output):
    with open(input, 'r') as infile, open(output, 'w') as out:
        for line in infile:
            columns = line.strip().split('\t')
            for value in columns:
                out.write(value + '\n')
        
        infile.close()
        out.close()

in_file = 'sbox.txt'
out_file = 'sbox_raw.txt'
sbox_raw(in_file, out_file)