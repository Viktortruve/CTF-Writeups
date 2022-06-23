import hmac
import hashlib
import base64
from os import lseek
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives.kdf.hkdf import HKDF
from Crypto.Cipher import AES
from Crypto.Util import Counter

salt = b"LastStand-MessageKey"
secret_pass = b"Secret-Passphrase"

hmac_secret = hmac.new(salt, secret_pass, hashlib.sha256).digest()
#hmac_secret_bytes = hmac_secret.encode()



zip_password = base64.b64encode(hmac_secret).decode()



secret_pass_sha_256 = hashlib.sha256(secret_pass).digest()

hkdf = HKDF(
    algorithm=hashes.SHA256(),
    length=48,
    salt=salt,
    info=None
)

hmac_key = hkdf.derive(secret_pass_sha_256)

aes_key = hmac_key[:32]
aes_iv = hmac_key[32:]

counter = Counter.new(nbits=16*8,initial_value=int.from_bytes(aes_iv,'big'))
aes_cipher = AES.new(aes_key,AES.MODE_CTR , counter=counter)



with open('chal.enc','rb') as file:
    infile = file.read()
    decrypted = aes_cipher.decrypt(infile)
 
    with open('flag.zip','wb') as outfile:
        outfile.write(decrypted)

print(f"zip pass: {zip_password}")



