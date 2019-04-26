### Chapter 3 -- Exercises

using LinearAlgebra, VMLS, Plots

a = 0:0.01:2*pi
x = cos.(a)
y = sin.(a)
plot(x,y)
println(correl_coef(x,y))


### Nearest Neighbor
println("Nearest Neighbor")
a = [1, 3, 4]
x = ([4,3,5], [0.4,10,50], [1,4,10], [30,40,50])
println(x[ argmin([norm(a-y) for y in x]) ])

### Orthogonality
println("Orthogonality")
a = zeros(3); a[1]=1
b = zeros(3); b[2]=1
c = zeros(3); c[3]=1

println(ang(a,c) * 180 / pi)
println(ang(b,c) * 180 / pi)

println(ang(a,b) * 180 / pi)
println(ang(a+b,c) * 180 / pi)
println(ang(a+c,b+c) * 180 / pi)

println("Orthogonality 2")
a = [1,1,0]
b = [1,1,1]
c = [1,-1,0]

println(ang(a,c) * 180 / pi)
println(ang(b,c) * 180 / pi)

println(ang(a,b) * 180 / pi)
println(ang(a+b,c) * 180 / pi)
println(ang(a+c,b+c) * 180 / pi)

println("Orthogonality 3")
a = zeros(3); a[1]=1
b = zeros(3); b[2]=1
c = zeros(3); c[3]=1

println(ang(a,c) * 180 / pi)
println(ang(b,c) * 180 / pi)
println(ang(a,b) * 180 / pi)

alfa = 1
beta = 3
gamma = 4

println(norm(alfa * a + beta * b + gamma * c))
println(alfa*norm(a) + beta*norm(b) + gamma*norm(c))
