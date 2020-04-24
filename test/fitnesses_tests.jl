using DiscO
using Test

@testset "Fitnesses" begin
    # OneMax
    fakeinstance = Dict(["size" => 0])
    @test onemax(fakeinstance, BitArray([1])) == 1
    @test onemax(fakeinstance, BitArray([0])) == 0
    @test onemax(fakeinstance, BitArray([0,1,0,1,1])) == 3

    # ZeroMax
    @test zeromax(fakeinstance, BitArray([1])) == 0
    @test zeromax(fakeinstance, BitArray([0])) == 1
    @test zeromax(fakeinstance, BitArray([0,1,0,1,1])) == 2

end
