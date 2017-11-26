#!/usr/bin/python

import numpy as np
import emcee
import lh as l
import math
import matplotlib.pyplot as plt

def binWalkers(probarray):
    binned = np.zeros([np.shape(probarray)[1],1])
    for i in range(np.shape(probarray)[1]):
        binned[i] = np.mean(probarray[:,i])
    return binned

def removeBurnin(bindata):
    return bindata[np.where(bindata>np.mean(bindata))[0][0]::]
    
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
