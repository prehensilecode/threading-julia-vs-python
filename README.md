# threading-julia-vs-python
Naive comparison of Julia threading vs Python threading

## Results

macOS Sonoma 14.7 on Intel(R) Core(TM) i7-9700 (8) @ 3.00 GHz

### Python

Python 3.11.10

Desc.        | Time           | Speedup
-------------|----------------|--------
No threads   | 2.1550e-01 sec | 1X
With threads | 2.5461e-03 sec | 84.64X
Pure numpy   | 1.8844e-02 sec | 11.44X 

### Julia

Julia 1.10.5

Code run with: `julia --threads 4 thr_julia.jl`

Desc.        | Time                                      | Speedup | Speedup over serial Python
-------------|-------------------------------------------|---------|---------------------------
No threads   | 8.890e-03 sec (4 allocations: 15.26 MiB)  | 1X      | 24.21X
Threads      | 3.112e-03 sec (25 allocations: 15.26 MiB) | 2.85X   | 69.24X

