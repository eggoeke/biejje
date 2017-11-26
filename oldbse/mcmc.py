#!/usr/bin/python

import numpy as np
import emcee
import dataprocess as dp
import graphs

#run MCMC
ndim = 6
nwalkers = 16
nsamples = 50
p0 = dp.makeRandomBinariesArray(nwalkers,.01)
sampler = emcee.EnsembleSampler(nwalkers, ndim, dp.makeLnLh)
pos, prob, state = sampler.run_mcmc(p0, 2)
sampler.reset()
sampler.run_mcmc(p0, nsamples)

graphs.plotcorner(10,sampler)
