
function staticBitMutation(prob)
    function _Mutation(instance, candidate, fitness)
        tmp = deepcopy(candidate.point)
        for item in 1:instance["size"]
            if rand() < prob
                tmp[item] = ~tmp[item]
            end
        end
        (point=tmp, fitness=fitness(instance, tmp))
    end
    _Mutation
end
