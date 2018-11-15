import math
import numpy as np
from matplotlib import pyplot as plt

lbdn2 = np.array([7.313, 44.61, 113.9, 215.2])
gn = np.array([0.749, 0.544, 0.463, 0.415])
lbdn4 = np.array([math.pow(e, 2) for e in lbdn2])

Pr = 0.71
r0 = 5
Re = 500
k = 0.024
a = 0.25e3


def xplus(x):
    return x / (r0 * Pr * Re)


xi1 = xplus(100)


def q(x):
    s = 0
    cxp = xplus(x)
    if cxp < xi1:
        for i in range(4):
            s += gn[i] / lbdn2[i] * (1 - math.exp(-lbdn2[i] * cxp))
    else:
        for i in range(4):
            s += gn[i] / lbdn2[i] * math.exp(-lbdn2[i] * cxp) * (math.exp(lbdn2[i] * xi1) - 1)

    return 2 * k * a / r0 * s


def dt(x):
    s = 0
    cxp = xplus(x)
    if cxp < xi1:
        for i in range(4):
            s += gn[i] / lbdn4[i] * (1 - math.exp(-lbdn2[i] * cxp))
    else:
        for i in range(4):
            s += gn[i] / lbdn4[i] * math.exp(-lbdn2[i] * cxp) * (math.exp(lbdn2[i] * xi1) - 1)

    return 8 * a * s


def nu(x):
    up = 0
    down = 0

    xp = xplus(x)
    if xp < xi1:
        for i in range(4):
            up += gn[i] / lbdn2[i] * (1 - math.exp(-lbdn2[i] * xp))
            down += gn[i] / lbdn4[i] * (1 - math.exp(-lbdn2[i] * xp))
    else:
        for i in range(4):
            up += gn[i] / lbdn2[i] * math.exp(-lbdn2[i] * xp) * (math.exp(lbdn2[i] * xi1) - 1)
            down += gn[i] / lbdn4[i] * math.exp(-lbdn2[i] * xp) * (math.exp(lbdn2[i] * xi1) - 1)

    return up / down / 2


if __name__ == '__main__':
    x = np.arange(25, 501, 5)
    qx = np.array([q(t) for t in x])
    dtx = np.array([dt(t) for t in x])
    nux = np.array([nu(t) for t in x])

    fig, (ax1, ax2, ax3) = plt.subplots(1, 3)
    ax1.plot(x, qx)
    ax1.set_title('q')
    ax2.plot(x, dtx)
    ax2.set_title('T0 - Tm')
    ax3.plot(x, nux)
    ax3.set_title('Nu')
    plt.show()
