#!/bin/bash

import sys
import numpy as np
nbin = int(sys.argv[1])
Z = float(sys.argv[2])
print nbin
for i in np.arange(nbin):
    m1 = 8*np.random.random()**(-1./1.7)
    print  m1, 0.08, 10000, 0, Z, 15000
