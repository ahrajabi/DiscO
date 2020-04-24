module DiscO

greet() = print("Hello World!")

include("fitnesses.jl")

export OneMax, ZeroMax, OneMaxF

include("mutations.jl")

export staticBitMutation

end # module
