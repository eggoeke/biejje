#!/bin/bash


#Plots the final mass of bbh 2 after time
import numpy as np
import matplotlib.pyplot as plt
TevOut,K1,K2,m1Out,m2Out,eccOut,pOut = np.loadtxt("binaries.out",unpack=True)
plt.hist(np.log(np.log(m1Out)), bins=500)
plt.show()
