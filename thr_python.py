#!/usr/bin/env python3
import numpy as np
import numba
from numba import jit
import time


SQRT_2PI = np.sqrt(2 * np.pi)

@jit(nopython=True, parallel=True)
def gaussians(x, means, widths):
    '''Return the value of gaussian kernels.

    x - location of evaluation
    means = array of kernel means
    widths - array of kernel widths
    '''

    n = means.shape[0]
    result = np.exp(-0.5 * ((x - means) / widths)**2) / widths
    return result / SQRT_2PI / n


means = np.random.uniform(-1, 1, size=1_000_000)
widths = np.random.uniform(0.1, 0.3, size=1_000_000)

gaussians(0.4, means, widths)

gaussians_nothread = jit(nopython=True)(gaussians.py_func)

t = time.time()
gaussians_nothread(0.4, means, widths)
dt1 = time.time() - t

t = time.time()
gaussians(0.4, means, widths)
dt2 = time.time() - t

# compare to pure numpy
t = time.time()
gaussians.py_func(0.4, means, widths)
dt3 = time.time() - t


print(f'No threads:   {dt1:.4e} sec ;\t1X')
print(f'With threads: {dt2:.4e} sec ;\t{dt1/dt2:.2f}X speedup')
print(f'Pure numpy:   {dt3:.4e} sec ;\t{dt1/dt3:.2f}X speedup')
