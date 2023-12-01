stack = Int[]
dir_sizes = Int[]

for line in readlines("input.txt")
    if line == "\$ cd .."
        push!(dir_sizes, pop!(stack))
        stack[end] += dir_sizes[end]
    elseif occursin("\$ cd", line)
        push!(stack, 0)
    elseif occursin(r"[1-9]", line)
        stack[end] += parse(Int, first(split(line)))
    end
end

while !isempty(stack)
    push!(dir_sizes, pop!(stack))
    if !isempty(stack)
        stack[end] += dir_sizes[end]
    end
end

space_needed = 30000000 - (70000000 - dir_sizes[end])
println(minimum(dir_sizes[[s>space_needed for s in dir_sizes]]))