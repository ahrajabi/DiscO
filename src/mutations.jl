
function flip(point::AbstractArray, prob::Float64)
    @assert zero(prob)<=prob<=one(prob) "The probability must be in range [0,1]"
    α = deepcopy(point)
    if prob == zero(prob)
        return α
    elseif prob == one(prob)
        return  flip.(α)
    end
    dist = Geometric(prob)
    index = rand(dist)+1
    while index <= length(α)
        α[index] = flip(α[index])
        index = index + rand(dist)+1
    end
    α
end

flip(bit::Bool) = ~bit

function staticBitMutation(prob::Float64)
    function _Mutation(instance, candidate, fitness)
        tmp = flip(candidate.point, prob)
        (point=tmp, fitness=fitness(instance, tmp))
    end
    _Mutation
end
