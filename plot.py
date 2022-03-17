import matplotlib.pyplot as plt
import numpy as np
import serpentTools as st

data = st.read('core_det0.m')
res_data = st.read('core_res.m')
fission = data['d1']
flux = data['d2']
universe = res_data.universes['2', 0, 0, 0]

energy = np.zeros(70)
multiplier = np.zeros(70)
micro = universe.microGroups
for i in range(70):
    energy[i] = np.exp((np.log(micro[i] * micro[i+1])) / 2)
    multiplier[i] = -np.log(energy[i]) / np.log(micro[i] / micro[i+1])
micro_flux = universe.infExp['infMicroFlx'] * multiplier

fig, ax = plt.subplots()
ax = fission.meshPlot('xmesh', 'ymesh', 'tallies')
fig, ax = plt.subplots()
ax = flux.meshPlot('xmesh', 'ymesh', 'tallies')

fig, ax = plt.subplots()
ax = universe.plot(['infMicroFlx'])
ax.set_yscale('linear')
ax.set_xlim(1e-8, 1e1)

fig, ax = plt.subplots()
ax.plot(energy, micro_flux)
ax.set_xscale('log')
ax.set_yscale('linear')
ax.set_xlim(1e-9, 1e1)