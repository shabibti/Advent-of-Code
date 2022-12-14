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

println(sum(findall(lines[1:2:end] .< lines[2:2:end])))