using Random

## Binary string fitnesses

function onemax(instance:: Dict{String, }, point::BitArray{1})
    sum(point)
end

function zeromax(instance:: Dict{String, }, point::BitArray{1})
    length(point) - sum(point)
end

function fractionmax(instance:: Dict{String, }, fraction::Float64)
    return function _F(instance, point)
        ## length(candidate)*fraction
        lastZero = Int(instance["size"]*fraction)
        ZeroMaxFitness(instance, point[1:lastZero]) + OneMaxFitness(instance, point[lastZero+1:end])
    end
end
