import matplotlib.pyplot as plt
import numpy as np

keff = np.zeros((4, 4, 4))
rho = np.zeros((4, 4, 4))
for inner in range(1, 5):
    for outer in range(1, 5):
        for sector_id in range(1, 5):
            sectors = sector_id * 2
            with open('nts-'
                      + str(inner)
                      + str(outer)
                      + str(sectors)
                      + '.out'
                      ) as f:
                for line in f:
                    line = line.split()
                    if (line) and (line[0] == 'Eigenvalue'):
                        value = float(line[2])
                        keff[inner-1][outer-1][sector_id-1] = value
                        rho[inner-1][outer-1][sector_id-1] = ((value - 1)
                                                              / value)
range = np.linspace(1, 4, 4)
range = np.linspace(1, 4, 4)

fig, ax = plt.subplots()
ax.plot(range, keff[:,3,3], label='inner')
ax.plot(range, keff[3,:,3], label='outer')
ax.plot(range, keff[3,3,:], label='sectors')
ax.legend()
ax.set_ylabel('keff')

# fig, ax = plt.subplots()
# ax.plot(range, keff[:,0,0], label='inner')
# ax.plot(range, keff[0,:,0], label='outer')
# ax.plot(range, keff[0,0,:], label='sectors')
# ax.legend()

print((keff[3,3,3]-keff[2,3,3])*1e5)
print((keff[3,3,3]-keff[0,3,3])*1e5)

print((keff[0,3,3]-keff[0,3,2])*1e5)
print((keff[0,3,2]-keff[0,3,1])*1e5)
print((keff[0,3,1]-keff[0,3,0])*1e5)

print((keff[0,2,3]-keff[0,2,2])*1e5)
print((keff[0,2,2]-keff[0,2,1])*1e5)
print((keff[0,2,1]-keff[0,2,0])*1e5)

print((keff[0,3,3]-keff[0,2,3])*1e5)
print((keff[0,2,3]-keff[0,1,3])*1e5)
print((keff[0,1,3]-keff[0,0,3])*1e5)

print((keff[0,3,2]-keff[0,2,2])*1e5)
print((keff[0,2,2]-keff[0,1,2])*1e5)
print((keff[0,1,2]-keff[0,0,2])*1e5)
