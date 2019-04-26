using VMLS, LinearAlgebra, Plots



### A Clustering Objective
println("A Clustering Objective")
Jclust(x,reps,assignment) = avg( [norm(x[i]-reps[assignment[i]])^2 for i=1:length(x)] )
x = [ [0,1], [1,0], [-1,1] ]
reps = [ [1,1], [0,0] ]
assignment = [1,2,1]
println(Jclust(x,reps,assignment))

assignment = [1,1, 2]
println(Jclust(x,reps,assignment))

### The k-means algorithm
println("The k-means algorithm")

function kmeans_(x, k; maxiters = 100, tol = 1e-5)
N = length(x)
n = length(x[1])
distances = zeros(N)    # used to store the distance of each
                        # point to the nearest representative.
reps = [zeros(n) for j=1:k] # used to store representatives.

# ’assignment’ is an array of N integers between 1 and k.
# The initial assignment is chosen randomly.
assignment = [ rand(1:k) for i in 1:N ]

Jprevious = Inf # used in stopping condition
for iter = 1:maxiters
    # Cluster j representative is average of points in cluster j.
    for j = 1:k
        group = [i for i=1:N if assignment[i] == j]
        reps[j] = sum(x[group]) / length(group);
    end;

    # For each x[i], find distance to the nearest representative
    # and its group index.
    for i=1:N
        (distances[i], assignment[i]) = findmin([norm(x[i] - reps[j]) for j = 1:k])
    end;

    # Compute clustering objective.
    J = norm(distances)^2 / N

    # Show progress and terminate if J stopped decreasing.
    println("Iteration ", iter, ": Jclust = ", J, ".")
    if iter>1&&abs(J-Jprevious)<tol*J
        return assignment, reps
    end

    Jprevious = J

end
end


X = vcat( [ 0.3*randn(2) for i = 1:100 ],
          [ [1,1] + 0.3*randn(2) for i = 1:100 ],
          [ [1,-1] + 0.3*randn(2) for i = 1:100 ] )

scatter([x[1] for x in X], [x[2] for x in X])
plot!(legend = false, grid = false, size = (500,500),
        xlims = (-1.5,2.5), ylims = (-2,2))

k = 3;
N = length(X)

assignment, reps = kmeans_(X, k)

grps  = [[X[i] for i=1:N if assignment[i] == j] for j=1:k]
scatter([c[1] for c in grps[1]], [c[2] for c in grps[1]])
scatter!([c[1] for c in grps[2]], [c[2] for c in grps[2]])
scatter!([c[1] for c in grps[3]], [c[2] for c in grps[3]])
plot!(legend = false, grid = false, size = (500,500),
        xlims = (-1.5,2.5), ylims = (-2,2))
