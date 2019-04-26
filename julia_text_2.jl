### Linear Functions
f(x) = x[1] + x[2] - x[4]^2
f([-1,0,1,2])

a = [1,2,3,4]
g(x) = a'*x

y=[1,2,3,4]
g(y)

z = [2, 3, 4, 5]
g(z)

g(2*y+z)

using VMLS, Statistics

println(avg(y))
println(mean(y))
println()


### Taylor Approximation
# A function
f(x) = x[1] + exp(x[2]-x[1]);
# And its gradient
grad_f(z) = [1-exp(z[2]-z[1]), exp(z[2]-z[1])];
z = [1, 2];
# Taylor approximation at z
f_hat(x) = f(z) + grad_f(z)'*(x-z);
# Approximation error
error_f(x) = f(x) - f_hat(x)

println(error_f([1,2]))
println(error_f([0.96,1.98]))
println(error_f([0.96,2.11]))
println(error_f([1.10,2.11]))
println()


### Regression Models
# Parameters in regression model
beta = [148.73, -18.85]; v = 54.40;
y_hat(x) = x'*beta + v;
#Evaluate regression model prediction
x = [0.846, 1]; y = 115;
println(y_hat(x), " ", y)
x = [1.324,2];  y = 234.50;
println(y_hat(x), " ", y)

D = house_sales_data();
price = D["price"]
area = D["area"]
beds = D["beds"]
v = 54.4017;
beta = [ 147.7251, -18.8534 ];
predicted = v .+ beta[1] * area + beta[2] * beds;
using Plots
scatter(price, predicted, lims = (0,800));
plot!([0, 800], [0, 800], linestyle = :dash);
# make axes equal and add labels
plot!(xlims = (0,800), ylims = (0,800), size = (500,500));
plot!(xlabel = "Actual price", ylabel = "Predicted price");
