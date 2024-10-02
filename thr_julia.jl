using Random
using BenchmarkTools

function gaussians(x, M, W)
    B = similar(M);
    for i in eachindex(M)
        @inbounds B[i] = exp(-0.5 * ((x - M[i])/W[i])^2 / W[i]);
    end
    B ./ sqrt(2*π) ./ size(B)
end

using Base.Threads

function threaded_gaussians(x, M, W)
    B = similar(M);
    Threads.@threads for i in eachindex(M)
        @inbounds B[i] = exp(-0.5 * ((x - M[i])/W[i])^2 / W[i]);
    end
    
    B ./ sqrt(2*π) ./ size(B)
end

M = rand(1_000_000) .* 2. .- 1.;
W = rand(1_000_000) .* 0.2 .+ 0.1;
@btime gaussians(0.4, M, W)
@btime threaded_gaussians(0.4, M, W)

println("Check for approximate equality: ", gaussians(0.4, M, W) ≈ threaded_gaussians(0.4, M, W))

