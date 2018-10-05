import os
import numpy as np
import math

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

print(rho_xy)

os.system('pause')