#!/usr/bin/python

import numpy as np
import emcee
import matplotlib.pyplot as pl
import corner
import math
from mpl_toolkits.mplot3d import Axes3D
from matplotlib.colors import ListedColormap

#must be of chain and not flatchain
def plotwalkerpos(nwalkers, data,dim):
    pl.figure()
    pl.title("Walker's position over iteration number")
    pl.xlabel("Iteration")
    pl.ylabel("Relative Coordinates for Posterior")
    for i in range(nwalkers):
        pl.plot(range(0,data.shape[1]),data[i][:][:,dim])


#must be of chain and not flatchain
def plotwalkerpos2(nwalkers, data):
    pl.figure()
    pl.title("Walker's position over iteration number")
    pl.xlabel("Iteration")
    pl.ylabel("Relative Coordinates for Posterior")
    for i in range(nwalkers):
        pl.plot(range(0,data.shape[1]),data[i][:][:,0],label="position in x")
        pl.plot(range(0,data.shape[1]),data[i][:][:,1],label="position in y")
        pl.legend()

#must be of chain and not flatchain
def plotwalkerlkhd(nwalkers, sampler,sampleStep,nsamples):
    pl.figure()
    pl.title("Walker's likelihood over number of iterations")
    pl.xlabel("Number of iterations")
    pl.ylabel("Log Likelihood")
    for i in range(nwalkers):
        pl.plot([x*sampleStep for x in range(0,nsamples/sampleStep)],sampler.lnprobability[i,::sampleStep])

def plotcorner(nbin,flatchain):
    fig = corner.corner(flatchain,bins=nbin, labels=["$x$","$y$"],range=[(-42012558092,22431788068),(-5000,5000)],truths=[0,0])
    fig.set_size_inches(10,10)

def plotdim(ndim, sampler):
    for i in range(ndim):
        pl.figure()
        pl.hist(sampler.flatchain[:,i], 100,normed= True, color="k", histtype="step")
        if(i == 0):
            pl.title("Probability Distribution of x")
            pl.xlabel("x")
        else:
            pl.title("Probability Distribution of y")
            pl.xlabel("y")
        pl.ylabel("Probability density of walkers")

def plotwalkerpos3(nwalkers, data):
    fig = pl.figure()
    ax = fig.gca(projection='3d')
    for i in range(nwalkers):
        ax.plot(data[i][:][:,0],data[i][:][:,1],range(0,data.shape[1]))


def versiontuple(v):
    return tuple(map(int, (v.split("."))))


def plot_decision_regions(X, y, classifier, test_idx=None, resolution=0.02):
    X = X[::4][:]
    y = y[::4][:]
    # setup marker generator and color map
    markers = ('s', 'x', 'o', '^', 'v')
    colors = ('red', 'blue', 'lightgreen', 'gray', 'cyan')
    cmap = ListedColormap(colors[:len(np.unique(y))])

    # plot the decision surface
    x1_min, x1_max = X[:, 0].min() - 1, X[:, 0].max() + 1
    x2_min, x2_max = X[:, 1].min() - 1, X[:, 1].max() + 1
    xx1, xx2 = np.meshgrid(np.arange(x1_min, x1_max, resolution),
                           np.arange(x2_min, x2_max, resolution))
    Z = classifier.predict(np.array([xx1.ravel(), xx2.ravel()]).T)
    Z = Z.reshape(xx1.shape)
    pl.contourf(xx1, xx2, Z, alpha=0.4, cmap=cmap)
    pl.xlim(xx1.min(), xx1.max())
    pl.ylim(xx2.min(), xx2.max())

    for idx, cl in enumerate(np.unique(y)):
        pl.scatter(x=X[y == cl, 0], y=X[y == cl, 1],
                    alpha=0.8, c=cmap(idx),
                    marker=markers[idx], label=cl)

    # highlight test samples
    if test_idx:
        # plot all samples
        if not versiontuple(np.__version__) >= versiontuple('1.9.0'):
            X_test, y_test = X[list(test_idx), :], y[list(test_idx)]
            warnings.warn('Please update to NumPy 1.9.0 or newer')
        else:
            X_test, y_test = X[test_idx, :], y[test_idx]
        pl.scatter(X_test[:, 0],
                    X_test[:, 1],
                    c='',
                    alpha=1.0,
                    linewidths=1,
                    marker='o',
                    s=55, label='test set')


def plotSVM(svm, X_xor, y_xor):
    pl.xlim([-4, 4])
    pl.ylim([-4, 4])
    pl.legend(loc='best')
    pl.tight_layout()
    plot_decision_regions(X_xor,y_xor, classifier=svm)
    pl.legend(loc='upper left')
    pl.tight_layout()

def showPlot():
    pl.show()
