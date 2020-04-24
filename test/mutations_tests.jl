using DiscO
using Test
using Random


@testset "Mutations" begin
    # input and output
    n = 10
    start = bitrand(n)
    instance = Dict(["size"=>n])
    candidate = (point = start, fitness=onemax(instance, start))
    res = staticBitMutation(0)(instance, candidate, onemax)

    @test length(res.point) == n
    @test candidate.point == res.point
    @test candidate.fitness == res.fitness

    res = staticBitMutation(1)(instance, candidate, onemax)
    @test candidate.point == .~ res.point
    @test candidate.fitness == n - res.fitness
end
