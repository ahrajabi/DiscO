module DiscO

using Random, Distributions, DataFrames
include("fitnesses.jl")

export onemax, zeromax, fractionmax

include("mutations.jl")

export staticBitMutation, flip

include("db.jl")

export db, setup, finish, store, info, record, result, meta, dbEngine

include("ea.jl")

export ea1p1

end # module
