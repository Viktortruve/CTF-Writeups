import numpy as np
numbers = np.random.choice(10**8, size=10**8, replace=False).astype(str)
numbers = list(filter(lambda p: p[0]=='2' and p[5]=='2',map(lambda s: s.zfill(8), numbers)))


with open('out.txt', 'w') as file:
    file.write("\n".join(numbers))



