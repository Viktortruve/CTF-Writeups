from binascii import hexlify
import codecs

with open("blind_for_.-.txt", "r") as f:
    for line in f:
        b_line = str.encode(line)
        hex_encoded = codecs.encode(b_line,"hex").decode()
        #print(hex_encoded)
        hex_chars = [hex_encoded[i:i+2] for i in range(0, len(hex_encoded), 2)]
        #print(hex_chars)
        morse_str = ""
        morse = ''.join([morse_str.join('.') if smb == "20" else morse_str.join('-') if smb == "09" else morse_str.join("\n") for smb in hex_chars])
        print(morse)


