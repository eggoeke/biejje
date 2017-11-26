#!/bin/bash

from __future__ import print_function
import numpy as np
from scipy.stats import norm
import subprocess, os

def removeLongPeriod(period, dat):
    return dat[:,np.array(np.where(dat[6,:] < period)).flatten()]

def removeStellarTypes(types, dat):
    ix1 = np.isin(dat[1,:], types)
    ix2 = np.isin(dat[2,:], types)
    good = np.array(np.where(np.multiply(ix1,ix2))).flatten()
    return dat[:,good]

def indexPeriod(period, dat):
    return np.array(np.where(dat[6,:]<period)).flatten()

def indexStellar(types, dat):
    ix1 = np.isin(dat[1,:], types)
    ix2 = np.isin(dat[2,:], types)
    return np.array(np.where(np.multiply(ix1,ix2))).flatten()

def mergerTime(dat):
    m1 = dat[3,:]
    m2 = dat[4,:]
    eta = np.power(np.divide(np.multiply(m1,m2),np.power((m1+m2),2)),-1)
    M = np.power(m1+m2,-5/3)
    c_t = 9.8
    period_h = np.power(np.multiply(dat[6,:],24),8/3)
    T_gw = np.multiply(np.multiply(c_t,period_h),np.multiply(M,eta))
    return T_gw

def maxMergerPeriod(dat):
    #approx age of universe
    T_gw = 10000
    c_t = 9.8
    c_t2 = T_gw/c_t
    m1 = dat[3,:]
    m2 = dat[4,:]
    eta = np.divide(np.multiply(m1,m2),np.power((m1+m2),2))
    M = np.power(m1+m2,5/3)
    max_p = np.multiply(np.power(np.multiply(c_t,np.multiply(M,eta)),3/8),24)
    return max_p

def classifyMergingBinaries(dat):
    K1 = dat[1,:]
    K2 = dat[2,:]
    ecc = dat[5,:]
    p = dat[6,:]
    max_p = maxMergerPeriod(dat)
    boolA = ((K1==14) & (K2==14) & (ecc != -1) & (p < max_p))
    state = np.zeros(np.size(boolA))
    state[np.where(boolA == True)] = 1
    state[np.where(boolA == False)] = -1
    return state

def makeLnLh(x):
    m1_mean = 10
    m1_std = .5
    m2_mean = 10
    m2_std = .5
    makeBinaryFile(x)
    callpopbin()
    dat =  np.loadtxt("binaries.out", unpack=True)
    m1_f = dat[3]
    m2_f = dat[4]
    lnlh = np.log(np.multiply(norm.pdf( (m1_f-m1_mean)/m1_std), norm.pdf( (m2_f-m2_mean)/m2_std)) )
    return lnlh

def make_random_binary():
    logPeriodInDays = 10*np.random.random()   # lazy : no inner cutoff based on star size.
    m1 = 8*np.power(1-np.random.random(),1/(1-2.7)) # only above this mass
    m2 = 8 + (m1-8) * np.random.random()
    ecc = np.power(np.random.random(), 1/2.)
    return m1,m2,np.power(10.,logPeriodInDays), ecc

def makeRandomBinariesArray(nbin,Z):
    array = np.ones([nbin,6])
    for i in np.arange(nbin):
        m1,m2,p,ecc = make_random_binary()
        array[i] = m1, m2, p, ecc, Z, 200
    return array

def makeRandomBinariesFile(nbin,Z):
    f = open('binaries.in','w')
    print(nbin,file=f)
    for i in np.arange(nbin):
        m1,m2,p, ecc = make_random_binary()
        print(m1, m2, p, ecc, Z, 200,file=f)   # For massive stars, we only need 200 Myr to f

def makeBinaryFile(x):
    f = open('binaries.in','w')
    print(1,file=f)
    print(x[0,0],x[0,1],x[0,2],x[0,3],x[0,4],x[0,5],file=f)

def callpopbin():
    cmd = './popbin'
    subprocess.call(cmd.split(), shell=False)
