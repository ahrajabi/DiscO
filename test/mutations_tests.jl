using DiscO
using Test
using Random


@testset "Mutations" begin
    # input and output
    candidate = bitrand(10)
    res = staticBitMutation(0)((), candidate)
    @test length(res) == 10
    @test candidate == res
    res = staticBitMutation(1)((), candidate)
    @test candidate == .~ res


end
