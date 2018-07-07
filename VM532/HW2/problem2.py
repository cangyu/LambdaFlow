import math
import numpy as np
from matplotlib import pyplot as plt

Am = np.array([7.630e-3, 2.053e-3, 0.903e-3, 0.491e-3, 0.307e-3])
rm2 = np.array([25.68, 83.86, 174.2, 296.5, 450.9])
rm4 = np.array([math.pow(e, 2) for e in rm2])
n = len(Am)
xi1 = 0.1


def dt(xp):
    s = 0
    if xp < xi1:
        s += 4 * xp
        for i in range(n):
            s += (1 - math.exp(-rm2[i] * xp)) / (rm4[i] * Am[i])
    else:
        s += 4 * xi1
        for i in range(n):
            s += (math.exp(rm2[i] * xi1) - 1) * math.exp(-rm2[i] * xp) / (rm4[i] * Am[i])

    return s


if __name__ == '__main__':
    x = np.arange(0, 0.5, 0.02)
    dtx = np.array([dt(t) for t in x])

    fig, ax = plt.subplots(1, 1)
    ax.plot(x, dtx)
    plt.show()
