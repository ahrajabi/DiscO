using Documenter, DiscO

makedocs(;
    modules=[DiscO],
    format=Documenter.HTML(),
    pages=[
        "Home" => "index.md",
    ],
    repo="https://github.com/ahrajabi/DiscO.jl/blob/{commit}{path}#L{line}",
    sitename="DiscO.jl",
    authors="Amirhossein Rajabi",
    assets=String[],
)

deploydocs(;
    repo="github.com/ahrajabi/DiscO.jl",
)
