
function staticBitMutation(prob)
    function _Mutation(instance, candidate)
        tmp = copy(candidate)
        for item in 1:length(tmp)
            if rand() < prob
                tmp[item] = 1-tmp[item]
            end
        end
        tmp
    end
    _Mutation
end
