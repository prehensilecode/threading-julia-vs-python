using BenchmarkTools

function sqrt_array(A)
    B = similar(A)
    for i in eachindex(A)
        @inbounds B[i] = sqrt(A[i])
    end
    B
end

using Base.Threads

function threaded_sqrt_array(A)
    B = similar(A)
    @threads for i in eachindex(A)
        @inbounds B[i] = sqrt(A[i])
    end
    B
end

A = rand(1000, 1000)
@btime sqrt_array(A);
@btime threaded_sqrt_array(A);

sqrt_array(A) ≈ threaded_sqrt_array(A)
