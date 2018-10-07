import numpy as np
import cantera as ct

co2 = ct.CarbonDioxide()
ch4 = ct.Methane()
o2 = ct.Oxygen()
h2o = ct.Water()
n2 = ct.Nitrogen()

co2.TP = 1000, 101325