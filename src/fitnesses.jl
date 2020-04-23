using Random

## Binary string fitnesses

function OneMax(instance, candidate)
    sum(candidate)
end

function ZeroMax(instance, candidate)
    length(candidate) - sum(candidate)
end

function OneMaxF(instance, fraction)
    return function _F(instance, candidate)
        ## length(candidate)*fraction
        lastZero = Int(length(candidate)*fraction)
        ZeroMaxFitness(instance, candidate[1:lastZero]) + OneMaxFitness(instance, candidate[lastZero+1:end])
    end
end
