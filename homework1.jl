using LinearAlgebra, SparseArrays, VMLS

a = randn(10^8);
b = randn(10^8);
@time s=dot(a,b)
println(s)

println("Hello, World !")
