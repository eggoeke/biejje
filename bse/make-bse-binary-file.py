import sys
import random

idum= random.getrandbits(16)
Z = 0.001
neta = 0.5
bwind = 0.0
hewind =1.0
alpha1 = 3.0    # Reproduce binary.in
lambda1 = 0.5   # Reproduce binary.in
ceflag =0
tflag = 1
ifflag =0
wdflag =1
bhflag = 1      # allow BH kicks
nsflag = 1      # table of NS, BH birth masses
mxns = 3.0      # maximum NS mass
sigma = 190.0  # Velocity dispersion for kicks
beta = 0.125
xi = 1.0
acc2 = 1.5
epsnov = 0.001
eddfac = 10.0  # Reproduce binary.in
gamma = -1.0
pts1,pts2,pts3 = 0.05, 0.01, 0.02

m1,m2,p,ecc = sys.argv[1],sys.argv[2],sys.argv[3], sys.argv[4]

print m1, m2, 15000, p, 1, 1, Z, ecc
print neta, bwind, hewind, alpha1, lambda1
print ceflag, tflag, ifflag, wdflag, bhflag, nsflag, mxns, idum
print pts1, pts2, pts3
print sigma, beta, xi, acc2, epsnov, eddfac, gamma
