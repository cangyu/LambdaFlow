import numpy as np
from matplotlib import pyplot as plt
import math


def f(x):
    return math.exp(x)

def f_taylor(t):
    return 1+t+math.pow(t, 2)

def f_legendre(x):
    return 1.1752 + 1.1036 * x + 0.3578 * (3*math.pow(x, 2) -1)/2


N = 501

x = np.linspace(-1, 1, N)
ex = np.array([f(t) for t in x])
taylor = np.array([f_taylor(t) for t in x])
legendre = np.array([f_legendre(t) for t in x])

plt.plot(x, ex, label=r'$f(x)$')
plt.plot(x, taylor, label=r'Taylor series of $f(x)$ at $x=0$')
plt.plot(x, legendre, label=r'$p(x)$')
plt.legend()
plt.show()