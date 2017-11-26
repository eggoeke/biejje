#!/bin/bash

import numpy as np
import matplotlib.pyplot as plt
m1,m2,p,ecc, Z, Tevolve = np.loadtxt("binaries.in",skiprows=1,unpack=True)
TevOut, K1,K2,m1Out, m2Out, eccOut, pOut = np.loadtxt("binaries.out",unpack=True)
plt.plot(m1,m1Out)
plt.show()
