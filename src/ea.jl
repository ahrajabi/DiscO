using Dates
using Random

"""
    ea1p1(instance, solution, Mutation, Fitness, Stop, max_iteration, db)

    This is exactly (1+1)EA algorithm.
"""
function ea1p1(instance:: Dict{String, }, candidate, mutation, fitness, stop, db:: dbEngine)

    best = deepcopy(candidate)

    for iter in 1:BigInt(typemax(Int64))

        candidate = mutation(instance, best, fitness)

        if candidate.fitness >= best.fitness
            best = candidate

            record(db, (id=db.id, best=best.fitness, step=iter))

            if stop(instance, best, iter)
                result(db, (id=db.id,step=iter, value=best.fitness))
                break
            end
        end
    end
    best
end
