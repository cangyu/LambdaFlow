import numpy as np
import math
from matplotlib import pyplot as plt

T0 = 0.2
Tad = 1 + T0

lTf = np.arange(T0, Tad, 0.001)

lTa = np.array([1.0, 1.5, 2.0, 2.25, 2.5, 2.75])


if __name__ == '__main__':
    fig = plt.figure()
    ax = fig.add_subplot(111)
    ax.set_xlabel('Da')
    ax.set_ylabel(r'$\tilde{T}_f$')

    sol = np.zeros((len(lTa), len(lTf)))
    for i, Ta in enumerate(lTa):
        for j, Tf in enumerate(lTf):
            sol[i][j] = (Tf - T0) * math.exp(Ta/Tf) / (Tad - Tf)

    for i in range(len(sol)):
        ax.plot(sol[i], lTf, label=r'$\tilde{T}_a = $' + str(lTa[i]))

    ax.legend()
    plt.show()
