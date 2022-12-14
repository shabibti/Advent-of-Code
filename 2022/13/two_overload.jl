lines = [ eval(Meta.parse(line)) for line in filter(!isempty, readlines("input.txt")) ]

function Base.isless(x::Int, y::AbstractVector)
    return [x] < y
end

function Base.isless(x::AbstractVector, y::Int)
    return x < [y]
end

function Base.isequal(x::Int, y::AbstractVector)
    return [x] == y
end

function Base.isequal(x::AbstractVector, y::Int)
    return x == [y]
end

index_2 = 1 + sum(lines .< [[2]])
index_6 = 2 + sum(lines .< [[6]])

println(index_2*index_6)