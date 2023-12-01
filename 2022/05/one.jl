using DataStructures

lines = readlines("input.txt")
pre_index = findfirst(contains("1"), lines)
num_stacks = parse(Int, split(lines[pre_index])[end])
stacks = [Stack{Char}() for _ in 1:num_stacks]
initial_stack_data = [s[begin:2:end] for s in reverse(replace.(view(lines, 1:pre_index-1), "["=>"", "]"=>"", "  "=>" "))]

# initialize stacks
for line in initial_stack_data
    for i in 1:num_stacks
        if(isletter(line[i]))
            push!(stacks[i], line[i])
        end
    end
end

# execute instructions
for line in @view lines[pre_index+2:end]
    num_crates, from, to = parse.(Int, split(line)[2:2:6])
    for i in 1:num_crates
        push!(stacks[to], pop!(stacks[from]))
    end
end

print.(first.(stacks))