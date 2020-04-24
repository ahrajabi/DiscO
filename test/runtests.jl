using SafeTestsets

@safetestset "Fitnessses Tests" begin include("fitnesses_tests.jl") end

@safetestset "Mutations Tests" begin include("mutations_tests.jl") end
