import os
import numpy as np
import math
from matplotlib import pyplot as plt

def f():
    N = 100

    X = np.random.rand(N)
    Y = np.random.rand(N)

    XY = X*Y
    X2 = X*X
    Y2 = Y*Y

    E_XY = sum(XY)/N
    E_X2 = sum(X2)/N
    E_Y2 = sum(Y2)/N
    E_X = sum(X)/N
    E_Y = sum(Y)/N

    rho_xy = (E_XY - E_X * E_Y)/math.sqrt(E_X2 * E_Y2)

    return rho_xy

if __name__ == '__main__':
    seq = [f() for i in range(501)]
    plt.xlabel('Index')
    plt.ylabel(r'$\rho_{XY}$')
    plt.plot(seq)
    plt.show()