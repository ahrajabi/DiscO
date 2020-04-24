using DiscO
using Random
data = db()

meta(data, "name", "(1+1) EA")
meta(data, "description", "This is for test.")

# Size of the bitstring.
n = 100

# Instance contains data relating to the problem, e.g. Graph
# Here, we don't have any specific information regarding the problem just the size
instance = Dict(["size"=> n])

# We want to optimize OneMax funciton, OneMax := sum(candidate)
fitness = onemax

# Using bitrand we create a string with n bits chosen
# unifromly random from 0 and 1
start = bitrand(n)
candidate = (point=start, fitness=fitness(instance, start))

# The algorithm must be stop when the fitness becomes n
stop(instance, best, iter) = (best.fitness == instance["size"] || iter == 100000)

# We use static bit mutation with probability 1/n.
mutation = staticBitMutation(1/n)

# Run algorithm (1+1) EA with standard mutation probability
optimum = ea1p1(instance, candidate, mutation, fitness, stop, data)
