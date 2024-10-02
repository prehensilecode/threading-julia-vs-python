macOS Sonoma 14.7 on Intel(R) Core(TM) i7-9700 (8) @ 3.00 GHz

## Python

Python 3.11.10

```
No threads   | 2.1550e-01 sec | 1X
With threads | 2.5461e-03 sec | 84.64X speedup
Pure numpy   | 1.8844e-02 sec | 11.44X speedup
```

## Julia

Julia 1.10.5

Code run with: `julia --threads 4 thr_julia.jl`

```
No threads   | 8.890e-03 sec (4 allocations: 15.26 MiB)  | 1X
Threads      | 3.112e-03 sec (25 allocations: 15.26 MiB) | 2.85X

