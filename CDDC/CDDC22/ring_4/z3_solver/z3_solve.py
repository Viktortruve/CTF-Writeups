from z3 import *
from pwn import *
from collections.abc import Iterable

x = [Int('x'+str(i)) for i in range(42)]

s = Solver()
sh = remote('54.255.223.3', 2251)
data = sh.recv()

for _ in range(42):
	sh.sendline('y')
	data = sh.recvuntil('\n',drop=True)
	s.add(eval(data))
	data = sh.recv()
	print(_)
sh.close()
s.check()

m = s.model()

s = ""
for i in range(42):
	print(type(m[x[i]].as_long()))
	s += str(m[x[i]].as_long())
	s += " "
s = s.strip()
l = [chr(int(item)) for item in s.split()]

print("".join(l))




