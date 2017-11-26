#!/usr/bin/python

import numpy as np
import emcee
import dataprocess as dp
from matplotlib import pyplot as plt
#import graphs

class FakePool:
    def map(self,f,y):
#        print f, y
        return f(y)


my_pool = FakePool()

def runMCMC():
    #run MCMC
    ndim = 4
    nwalkers = 10
    nsamples = 1000
    p0 = dp.makeRandomBinariesArray(nwalkers)
    sampler = emcee.EnsembleSampler(nwalkers, ndim, dp.makeLnLh,pool=my_pool)
    #pos, prob, state = sampler.run_mcmc(p0, 2)
    sampler.reset()
    sampler.run_mcmc(p0, nsamples)
    return sampler

def noScript(sampler):
    dat =  sampler.flatchain
    for indx in np.arange(len(sampler.lnprobability)):
        plt.plot(sampler.lnprobability[indx])
    plt.savefig("my-lnL.png"); plt.clf()
    plt.scatter(dat[:,0], dat[:,1])
    plt.xlabel(r'$m_1 (M_\odot)$')
    plt.ylabel(r'$m_2 (M_\odot)$')
    plt.savefig('my-samples.png'); plt.clf()
    plt.scatter(dat[:,0], dat[:,3])
    plt.xlabel(r'$m_1 (M_\odot)$')
    plt.ylabel(r'$log_{10} Z$')
    plt.savefig('my-samples_2.png')

#graphs.plotcorner(10,sampler)
