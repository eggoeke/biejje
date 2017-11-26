#!/bin/bash

import sys
import numpy
nbin = int(sys.argv[1])
Z = float(sys.argv[2])
print nbin
for m1 in 6+ (100-6.)*numpy.arange(nbin)/(1.*nbin):
    # m1, m2, p(hours), eccentricity, metallicity, time to evolve (Myr)
    print  m1, 0.08, 10000, 0, Z, 15000
