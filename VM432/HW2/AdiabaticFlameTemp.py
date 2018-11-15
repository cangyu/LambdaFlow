import numpy as np
import cantera as ct
from matplotlib import pyplot as plt
from scipy import optimize

# CH4 + 2(O2 + 3.76 N2) -> CO2 + 2 H2O + 2*3.76 N2
m = 1
n = 4
comp = ['CH4:1', 'O2:1', 'CO2:1', 'H2O:1', 'N2:1']
w = np.array([16, 32, 44, 18, 28])
spec = [ct.Solution('gri30.xml') for _ in range(len(comp))]
for i in range(len(spec)):
    spec[i].X = comp[i]

# Reference State
T_ref = 300
P_ref = 101325

# Mass ratio of oxidizer and fuel at stoichiometry
mu = 2 * w[1] / (1 * w[0])

# Mass fraction of fuel in fuel stream
Yf_1 = 1.0

# Mass fraction of oxidizer in air stream
Yo_2 = 0.232

# Mixture fraction at stoichiometry
Zst = 1 / (1 + mu * Yf_1 / Yo_2)

# Mass fraction of CO2 at stoichiometry
Yco2_st = Yf_1 * Zst * m * w[2] / w[0]

# Mass fraction of H2O at stoichiometry
Yh2o_st = Yf_1 * Zst * n / 2 * w[3] / w[0]


# Equivalence ratio
def phi(Z):
    return Z / (1 - Z) * (1 - Zst) / Zst


# Unburned mass fraction
def Y_u(z):
    y_ch4 = Yf_1 * z
    y_o2 = Yo_2 * (1 - z)
    y_co2 = 0
    y_h2o = 0
    y_n2 = (1 - Yo_2) * (1 - z)
    return np.array([y_ch4, y_o2, y_co2, y_h2o, y_n2])


# Burned mass fraction
def Y_b(Z):
    if Z < Zst:
        # Fuel deficient
        y_ch4 = 0
        y_o2 = Yo_2 * (1 - Z / Zst)
        y_co2 = Yco2_st * Z / Zst
        y_h2o = Yh2o_st * Z / Zst
        y_n2 = (1 - Yo_2) * (1 - Z)
    else:
        # Fuel rich
        y_ch4 = Yf_1 * (Z - Zst) / (1 - Zst)
        y_o2 = 0
        y_co2 = Yco2_st * (1 - Z) / (1 - Zst)
        y_h2o = Yh2o_st * (1 - Z) / (1 - Zst)
        y_n2 = (1 - Yo_2) * (1 - Z)

    return np.array([y_ch4, y_o2, y_co2, y_h2o, y_n2])


def species_enthalpy(T):
    for k in range(len(spec)):
        spec[k].TP = T, P_ref
    return np.array([c.enthalpy_mass for c in spec])


def calc_temp(Z):
    Yu = Y_u(Z)
    Yb = Y_b(Z)

    h_u = sum(Yu * species_enthalpy(T_ref))

    def h_b(T):
        return sum(Yb * species_enthalpy(T))

    def f(T):
        return h_b(T) - h_u

    ret = optimize.newton(f, 1500)
    return ret


if __name__ == '__main__':
    Z = np.linspace(0.001, 1.0, 1000)
    T_ad = np.array([calc_temp(z) for z in Z])
    plt.plot(Z, T_ad)
    plt.xlabel('Mixture Fraction(Z)')
    plt.ylabel('Adiabatic Temperature/K')
    plt.title('Methane-Air Case')
    plt.show()
