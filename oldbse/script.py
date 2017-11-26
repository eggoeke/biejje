#!/bin/bash

import numpy as np
import matplotlib.pyplot as plt
nbin =50000
mFinal = np.zeros(nbin)
for i in np.arange(nbin):
    m1 = 8*np.random.random()**(-1./1.7)
    if (m1>100):
        continue
    if (m1 < 20):
        m1 = 1.4
    else:
        m1 = m1/2.
    print m1
    mFinal[i] = m1
hist, bins = np.histogram(mFinal,bins = 50)
width = 0.7*(bins[1]-bins[0])
center = (bins[:-1]+bins[1:])/2
plt.bar(center, hist, align = 'center',width = width)
plt.show()
