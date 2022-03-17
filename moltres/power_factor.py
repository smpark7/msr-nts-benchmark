import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import serpentTools as st

moltres = pd.read_csv("nts-power_csv.csv")
sss2 = st.read("../core-pinpower_det0.m")
# sss2['pinpowers'].meshPlot('x', 'y')

moltres_power = np.zeros((8,8))
sss2_power = np.zeros((8,8))
for i in range(8):
    for j in range(8):
        if i <= j:
            moltres_power[i,j] = moltres["channel" + str(i+1) + str(j+1)][2]
        else:
            moltres_power[i,j] = moltres["channel" + str(j+1) + str(i+1)][2]
        sss2_power[i,j] = sss2['pinpowers'].tallies[i+8,j+8]

disc = (moltres_power - sss2_power) / sss2_power * 100

fig, ax = plt.subplots()
im = ax.imshow(disc, cmap="RdBu_r", vmin=-2.5, vmax=2.5)
cbar = plt.colorbar(im)
cbar.set_label("% discrepancy in pin power [%]")

moltres = pd.read_csv("nts-homogenized_csv.csv")
sss2 = st.read("../core-homogenized_det0.m")
# sss2['pinpowers'].meshPlot('x', 'y')

moltres_power1 = np.zeros((8,8))
sss2_power = np.zeros((8,8))
for i in range(8):
    for j in range(8):
        if i <= j:
            moltres_power1[i,j] = moltres["channel" + str(i+1) + str(j+1)][2]
        else:
            moltres_power1[i,j] = moltres["channel" + str(j+1) + str(i+1)][2]
        sss2_power[i,j] = sss2['pinpowers'].tallies[i+8,j+8]

disc = (moltres_power1 - sss2_power) / sss2_power * 100

fig, ax = plt.subplots()
im = ax.imshow(disc, cmap="RdBu_r", vmin=-2.5, vmax=2.5)
cbar = plt.colorbar(im)
cbar.set_label("% discrepancy in pin power [%]")

hmg = (moltres_power1 - moltres_power) / moltres_power * 100

fig, ax = plt.subplots()
im = ax.imshow(hmg, cmap="RdBu_r", vmin=-1, vmax=1)
cbar = plt.colorbar(im)
cbar.set_label("% discrepancy in pin power [%]")
