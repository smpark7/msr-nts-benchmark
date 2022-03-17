import matplotlib.pyplot as plt
import numpy as np

sss2_keff = np.array([1.16028, 1.16079, 1.16057, 1.16004,
                      1.16046, 1.16031, 1.16050])
moltres_keff = np.array([1.1664257047, 1.1636771200, 1.1641090898,
                         1.1626451930, 1.1631412890, 1.1631532003,
                         1.1631480287])
# 12 energy groups
# Square mesh:               6x6           18x18
homogenized_keff = np.array([1.1617239541, 1.1617177295])

fig, ax = plt.subplots()
# ax.plot(sss2_keff, label='Serpent')
ax.plot(moltres_keff, label='Moltres')
ax.legend()
ax.set_ylabel('keff')
ax.set_xlabel('Energy group refinement level')

fig, ax = plt.subplots()
ax.plot(moltres_keff-sss2_keff)
