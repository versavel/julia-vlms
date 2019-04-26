#############
### EE103 Exercises -- Chapter 2
#############

using LinearAlgebra, SparseArrays, VMLS

### Ex 2.1 - Deviation of middle element value from average

f(x) = x[round(Int,(length(x)+1)/2)] - ones(length(x))' * x / length(x)

x = [1,2,3,4,5]
println(f(x))

x = [1,2,0,4,5]
println(f(x))


### Ex 2.2 - Nonlinear functions

f(x) = (x[1] - x[2] + x[3])^2

x = [0,1,2] ; y = [5,8,3];
a = 2; b = 5;

lhs = f(a*x+b*y)
rhs = a*f(x) + b*f(y)

println("### Nonlinear Functions (a)")
println(lhs)
println(rhs)

f(x) = max(x[1] + 2 * x[2] - x[3], 0)

x = [0,0,10] ; y = [10,0,0];
a = 2; b = 5;

lhs = f(a*x+b*y)
rhs = a*f(x) + b*f(y)

println("### Nonlinear Functions (b)")
println(lhs)
println(rhs)


### Ex 2.3 - Net present value

c = [ 0.1, 0.1, 0.1, 1.1 ];
n = length(c);
r = 0.05;   # 5% per-period interest rate
#d = (1+r) .^ -(0:n-1)
NPV(c, r) = c' * ((1+r) .^ -(0:n-1))

println("#### NPV ###")
println(2*NPV(c ,r) - NPV(2*c ,r))
println(2*NPV(c ,r) - NPV(c , 2*r))
