import numpy as np
from scipy.fftpack import fft,ifft
import matplotlib.pyplot as plt

fig, ax = plt.subplots(2, 1)

U = np.loadtxt('t3.txt')
n = len(U)

ax[0].set_xlabel('Sample Index')
ax[0].set_ylabel('U')
ax[0].set_title('Original Signal')
ax[0].plot(U)

uf = fft(U)
Ek = 0.5 * abs(uf)**2

n2 = int(n/2)
Ek2 = Ek[range(n2)]

ax[1].set_xscale("log")
ax[1].set_yscale("log")
ax[1].set_xlabel('Frequence')
ax[1].set_ylabel('E')
ax[1].set_title('Energy Spectrum')
ax[1].plot(Ek2)

plt.show()