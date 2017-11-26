#!/bin/bash

from __future__ import print_function
import numpy as np
from scipy.stats import norm
import subprocess, os
import emcee


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


def filterBadBSE(x,m1_l,m1_u,m2_l,m2_u,period_l,period_u):
    y = np.array(x)
    lnlh = -np.inf*np.ones(len(y))
    #stars smaller than 6 or larger than 130 sm
    indx_bad = np.logical_or(y[:,0]<m1_l,y[:,1]<m2_l)
    indx_bad = np.logical_or(indx_bad,y[:,0]>m1_u)
    indx_bad = np.logical_or(indx_bad,y[:,1]>m2_u)
    #periods smaller than e-3 or larger than e4
    indx_bad = np.logical_or(indx_bad,y[:,2]<period_l)
    indx_bad = np.logical_or(indx_bad,y[:,2]>period_u)
    #what BSE will accept for Z
    indx_bad = np.logical_or(indx_bad,y[:,3]<-4)
    indx_bad = np.logical_or(indx_bad,y[:,3]>np.log10(0.03))
    
    indx_good = np.logical_not(indx_bad)
    x_good = y[indx_good]
    return indx_good, x_good
    
def makeLnLh(x):
    m1_mean = 10
    m1_std = .5
    m2_mean = 10
    m2_std = .5
    
    lnlh = -np.inf*np.ones(len(x))
    indx_good, x_good = filterBadBSE(x,6,130,6,130,-3,4)

    if np.size(x_good) > 0:
        #print(np.size(np.where(indx_good==True)))
        makeBinaryFile(x_good)
        callpopbin()
        dat =  np.loadtxt("binaries.out", unpack=True)
        m1_f = dat[3,:] if np.size(np.shape(dat)) > 1 else dat[3]
        m2_f = dat[4,:] if np.size(np.shape(dat)) > 1 else dat[4]
        lnlh[indx_good] = np.log(np.multiply(norm.pdf( (m1_f-m1_mean)/m1_std), norm.pdf( (m2_f-m2_mean)/m2_std)) )
    return lnlh

def make_random_binary():
    logPeriodInDays = -1+3*np.random.uniform()   # lazy : no inner cutoff based on star size.
    m1 = 8*np.power(1-np.random.random(),1/(1-2.7)) # only above this mass
    m2 = 8 + (m1-8) * np.random.random()
    ecc = np.power(np.random.random(),1/2.)
    Z = np.log10(.01)+.1*np.random.uniform(size=1)
    return m1,m2,np.power(10.,logPeriodInDays), ecc, np.power(10,Z)

def makeRandomBinariesArray(nbin):
    array = np.ones([nbin,4])
    for i in np.arange(nbin):
        m1,m2,p,ecc, Z = make_random_binary()
        array[i] = m1, m2, np.log10(p), np.log10(Z)
    return array

def makeRandomBinariesFile(nbin):
    f = open('binaries.in','w')
    print(nbin,file=f)
    for i in np.arange(nbin):
        m1,m2,p, ecc, Z = make_random_binary()
        print(m1, m2, p, ecc, Z, 200,file=f)

#assumes MCMC is being run in log period and log Z
def makeBinaryFile(x):
    f = open('binaries.in','w')
    print(len(x),file=f)
    for indx in np.arange(len(x)):
        print(x[indx][0],x[indx][1],np.power(10,x[indx][2]),0,np.power(10,x[indx][3]),200,file=f)

def callpopbin():
    cmd = './popbin'
    subprocess.call(cmd.split(), shell=False)

def binWalkers(probarray):
    binned = np.zeros([np.shape(probarray)[1],1])
    for i in range(np.shape(probarray)[1]):
        binned[i] = np.log(np.mean(np.exp(probarray[:,i])))
    return binned

def removeBurnin(bindata):
    return bindata[np.where(bindata>np.log(np.mean(np.exp(bindata))))[0][0]::]

def indexOfBurn(bindata):
    return np.where(bindata>np.mean(bindata))[0][0]

def removeBurninFlat(bindata, flatprob,nwalkers):
    ind = indexOfBurn(bindata)
    return flatprob[ind*nwalkers::]

def indexBelowAvg(bindata):
    avg = np.mean(bindata)
    std = np.std(bindata)
    return np.where((bindata<(avg-std)))[0][:]

#return indices to ignore
def indexBelowAvgFlat(bindata):
    ind =np.multiply( indexBelowAvg(bindata),nwalkers)
    new_ind = ind[:,np.newaxis]+np.r_[0:nwalkers]
    return new_ind

def indexAboveAvgFlat(bindata):
    ind =np.multiply(np.where((bindata>(avg-std)))[0][:],nwalkers)
    new_ind = ind[:,np.newaxis]+np.r_[0:nwalkers]
    return new_ind.flatten()

#must use index above average first
def indexOutsideStdDev(nbflat):
    avg= np.mean(nbflat)
    std = np.std(nbflat)
    return np.where((nbflat<(avg-std)))[0][:]

def indexInsideStdDev(nbflat):
    avg = np.mean(nbflat)
    std = np.std(nbflat)
    return np.where((nbflat>(avg-std)))[0][:]

def classifyPositions(sampler):
    position = sampler.flatchain
    prob = sampler.lnprobability
    bindata = binWalkers(prob)
    nbdata = removeBurnin(bindata)
    flatprob = sampler.flatlnprobability
    nbflat = removeBurninFlat(bindata, flatprob,sampler.chain.shape[0])
    boolA = ((flatprob > (np.mean(nbflat)-3*np.std(nbflat))) & (flatprob < (np.mean(nbflat)+3*np.std(nbflat))))
    state = np.zeros(np.size(flatprob))
    state[np.where(boolA == True)] = 1
    state[np.where(boolA == False)] = -1
    return position, state

#'good'
def goodFlatInd(sampler):
    prob = sampler.lnprobability
    indx_bad = np.logical_not(prob == -np.inf)
    prob = prob[indx_bad]
    #bindata = binWalkers(prob)
    #nbdata = removeBurnin(bindata)
    #flatprob = sampler.flatlnprobability
    #nbflat = removeBurninFlat(bindata, flatprob,sampler.chain.shape[0])
    #print(np.mean(nbflat))
    #print(np.std(nbflat))
    #print(np.mean(nbflat) > np.exp(flatprob))
    #boolA = ((np.exp(flatprob) > (np.mean(nbflat)-3*np.std(nbflat))) & (np.exp(flatprob) < (np.mean(nbflat)+3*np.std(nbflat))))
    return prob
