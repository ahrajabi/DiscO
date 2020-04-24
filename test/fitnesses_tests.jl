using DiscO
using Test

@testset "Fitnesses" begin
    # OneMax
    @test OneMax((), [1]) == 1
    @test OneMax((), [0]) == 0
    @test OneMax((), [0,1,0,1,1]) == 3

    # ZeroMax
    @test ZeroMax((), [1]) == 0
    @test ZeroMax((), [0]) == 1
    @test ZeroMax((), [0,1,0,1,1]) == 2



end
