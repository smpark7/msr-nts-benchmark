import matplotlib.pyplot as plt
import numpy as np

radius = np.array([2, 1.7, 1.5, 1.3, 1.0])
mod_fuel_ratio = (100 - np.pi * radius ** 2) / (np.pi * radius ** 2)
fuel_fraction = np.pi * radius ** 2 / 100
keff = np.array([1.28695, 1.30941, 1.31570, 1.31305, 1.27784])
error = np.array([0.00046, 0.00037, 0.00025, 0.00028, 0.00023])

fig, ax = plt.subplots()
ax.plot(mod_fuel_ratio, keff, marker='.')
ax.set_ylabel(r'$k_{eff}$')
ax.set_xlabel(r'Moderator to fuel ratio')

fig, ax = plt.subplots()
ax.plot(radius, keff, marker='.')
ax.set_ylabel(r'$k_{eff}$')
ax.set_xlabel(r'Radius [cm]')

fig, ax = plt.subplots()
ax.plot(fuel_fraction, keff, marker='.')
ax.set_ylabel(r'$k_{eff}$')
ax.set_xlabel(r'Fuel volume fraction')