import math
import numpy as np

a = 1
b = math.pi / 2


def g(x):
    return math.atan(4 * x)


N = 21
x = np.zeros(N)
x[0] = (a + b) / 2

for i in range(1, N):
    x[i] = g(x[i - 1])

print(x)
xs = x[-1]
print(xs)
print(math.tan(xs))
print(4 * xs)
