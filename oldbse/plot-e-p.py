#!/bin/bash


#Plots the final mass of bbh 2 after time
import numpy as np
import matplotlib.pyplot as plt
import dataprocess as dp
import matplotlib.patches as mpatches

TevOut,K1,K2,m1Out,m2Out,eccOut,pOut = np.loadtxt("binaries.out.nondisrupted",unpack=True)
dat = np.loadtxt("binaries.out.nondisrupted",unpack=True)
mergingIndices = np.intersect1d(dp.indexPeriod(.5,dat),dp.indexStellar([13,14],dat))
plt.scatter(eccOut, np.log(pOut))
plt.scatter(eccOut[mergingIndices],np.log(pOut[mergingIndices]),c='r')
plt.title('Natural log of period vs eccentricity in stellar binaries')
plt.ylabel('ln(P)')
plt.xlabel('e')
red_patch = mpatches.Patch(color='red', label='Merging binaries')
blue_patch = mpatches.Patch(color='blue', label='All binaries')
plt.legend(handles=[red_patch,blue_patch])
plt.show()
