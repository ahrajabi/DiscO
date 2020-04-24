using DiscO
using Test
using Random


@testset "Mutations" begin
    @testset "Static Bit Mutation" begin
        n = 10
        start = bitrand(n)
        instance = Dict(["size"=>n])
        candidate = (point = start, fitness=onemax(instance, start))
        res = staticBitMutation(0.0)(instance, candidate, onemax)

        @test length(res.point) == n
        @test candidate.point == res.point
        @test candidate.fitness == res.fitness

        res = staticBitMutation(1.0)(instance, candidate, onemax)
        @test candidate.point == .~ res.point
        @test candidate.fitness == n - res.fitness
    end

    @testset "Flip Bit String" begin
        n = 10000
        point = bitrand(n)
        res = flip(point, 0.0)

        @test length(point) == n
        @test res == point

        res = flip(point, 1.0)
        @test res == .~ point

        # Undeterministic TEST !!!
        # If it fails, you were probably unlucky so run once more and pray.
        n = 1000000
        res = flip(BitArray(zeros(n)), 0.5)
        @test 400000 < sum(res) < 600000
    end

    @testset "Binary Flip Operator" begin
        @test flip(true) == false
        @test flip(false) == true
    end

end
