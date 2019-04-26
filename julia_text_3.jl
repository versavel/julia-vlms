### Chapter 3

using LinearAlgebra, VMLS, Plots

### Norm
println("### Norm Calculation ###")
x = [ 2, -1, 2 ];
println(norm(x))
println(sqrt(x' * x))
println(sqrt(sum(x.^2)))

println("### Triangle Inequality")
x = randn(10); y = randn(10);
println(norm(x+y))
println(norm(x)+norm(y))

println("RMS value")
println(norm(x)/sqrt(length(x)))
println(rms(x))

println("Signal and RMS plot")
t = 0:0.01:1;  # List of times
x = cos.(8*t) - 2*sin.(11*t);
plot(t, x)
plot!(t, avg(x)*ones(length(x)))
plot!(t, (avg(x)+rms(x))*ones(length(x)), color = :green)
plot!(t, (avg(x)-rms(x))*ones(length(x)), color = :green)
plot!(legend = false)

#println("Chebyshev inequality")
#a = 0:0.01:2*maximum(x)
#max_entries = floor((norm(a)^2) ./ (a.^2))
#plot(a, max_entries)

println("Chebyshev bound")
# Define Chebyshev bound function
cheb_bound(x,a) = floor(norm(x)^2/a);
a = 1.5;
println(cheb_bound(x,a))
# Number of entries of x with |x_i| >= a
println(sum(abs.(x) .>= a))

### Distance

println("Distance")
u = [1.8, 2.0, -3.7, 4.7];
v = [0.6, 2.1, 1.9, -1.4];
w = [2.0, 1.9, -4.0, 4.6];
println(norm(u-v), " ", norm(u-w), " ", norm(v-w))
#(8.36779540858881, 0.3872983346207417, 8.532877591996735)

println("Nearest Neighbor")
nearest_neighbor(x,z) = z[ argmin([norm(x-y) for y in z]) ];
z = ( [2,1], [7,2], [5.5,4], [4,8], [1,5], [9,6] );
println(nearest_neighbor([5,6], z))
println(nearest_neighbor([3,3], z))

println("De-mean")
de_mean(x) = x .- avg(x);  # Define de-mean function
x = [1, -2.2, 3];
println(x)
println(avg(x))
x_tilde = de_mean(x)
println(x_tilde)
println(avg(x_tilde))


### Standard Deviation

println("Standard Deviation")
x = rand(100);
# VMLS definition of std
stdev_(x) = norm(x.-avg(x))/sqrt(length(x));
println(stdev_(x))
println(stdev(x))

println("Return and Risk")

println("Standardizing a Vector")
function standardize(x)
       x_tilde = x .- avg(x)   # De-meaned vector
       return x_tilde/rms(x_tilde)
       end
x = rand(100);
println(avg(x), " ,", rms(x))
#(0.510027255229345, 0.5883938729563185)
z = standardize(x);
println(avg(z), " ,", rms(z))
#(1.965094753586527e-16, 1.0)

### Angle

println("Angle")
# Define angle function, which returns radians
ang_(x,y) = acos(x'*y/(norm(x)*norm(y)));
a = [1,2,-1]; b=[2,0,-3];
println(ang_(a,b))
#0.9689825515916383
println(ang(a,b)*(360/(2*pi)))

println("Correlation Coefficient")
function correl_coef_(a,b)
                a_tilde = a .- avg(a)
                b_tilde = b .- avg(b)
                return (a_tilde'*b_tilde)/(norm(a_tilde)*norm(b_tilde))
                end
a = [4.4, 9.4, 15.4, 12.4, 10.4, 1.4, -4.6, -5.6, -0.6, 7.4];
b = [6.2, 11.2, 14.2, 14.2, 8.2, 2.2, -3.8, -4.8, -1.8, 4.2];
println(correl_coef(a,b))
#0.9678196342570434
a = [4.1, 10.1, 15.1, 13.1, 7.1, 2.1, -2.9, -5.9, 0.1, 7.1];
b = [5.5, -0.5, -4.5, -3.5, 1.5, 7.5, 13.5, 14.5, 11.5, 4.5];
println(correl_coef(a,b))
#-0.9875211120643734
a = [-5.0, 0.0, 5.0, 8.0, 13.0, 11.0, 1.0, 6.0, 4.0, 7.0];
b = [5.8, 0.8, 7.8, 9.8, 0.8, 11.8, 10.8, 5.8, -0.2, -3.2];
println(correl_coef(a,b))
#0.004020976661367021

println("Complexity")
x = randn(10^6); y = randn(10^6);
@time correl_coef(x,y)
@time correl_coef(x,y)
@time correl_coef(x,y)
x = randn(10^7); y = randn(10^7);
@time correl_coef(x,y)
@time correl_coef(x,y)
@time correl_coef(x,y)
x = randn(10^8); y = randn(10^8);
@time correl_coef(x,y)
@time correl_coef(x,y)
@time correl_coef(x,y)
