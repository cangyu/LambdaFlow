import numpy as np
from matplotlib import pyplot as plt
from math import pow
from scipy.integrate import quad
from scipy.special import betainc, beta

t0 = 0
t_inf = -7
u_inf = 46
p = 101325

L = 1.8
xi1 = 0
xi2 = 0.6

rho = 1.326
mu = 1.7894e-5

Cp = 1.005e3
k = 2.44e-2
Pr = mu * Cp / k
print(Pr)
Rex = rho * u_inf * L / mu
print(Rex)


def u1(x):
    return 1 - pow(xi1 / x, 3 / 4)


def u2(x):
    return 1 - pow(xi2 / x, 3 / 4)


def h(x):
    return -4 / 3 * x * (betainc(1 / 3, 4 / 3, u2(x)) - betainc(1 / 3, 4 / 3, u1(x))) * beta(1 / 3, 4 / 3)


q0 = (t0 - t_inf) * k * pow(Pr, 1 / 3) * pow(Rex, 1 / 2) / (0.623 * h(L))
print(q0)


def t(x: float):
    if x <= xi1:
        return t_inf
    elif x <= xi2:
        return t_inf + f(x, x)
    else:
        return t_inf + f(xi2, x)


def f(up: float, x: float):
    ret = 0.623 / k * pow(Pr, -1 / 3) * pow(Rex, -1 / 2) * q0

    def g(s):
        return pow(1 - pow(s / x, 3 / 4), -2 / 3)

    ri, err = quad(g, xi1, up)
    ret *= ri

    return ret


N = 101
x_val = np.linspace(0, L, N)
y_val = np.array([t(e) for e in x_val])

plt.plot(x_val, y_val)
plt.show()
