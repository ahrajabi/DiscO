module DiscO

greet() = print("Hello World!")

include("fitnesses.jl")

export onemax, zeromax, fractionmax

include("mutations.jl")

export staticBitMutation

include("db.jl")

export db, setup, finish, store, info, record, result, meta, dbEngine

include("ea.jl")

export ea1p1

end # module
