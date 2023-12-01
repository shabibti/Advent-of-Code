mutable struct Node
    value::Int
    parent
    children::Vector{Node}
end

total_size, space_needed, best_dir_size = 0, 0, 30000000

function computeTotal(N::Node)
    global space_needed, best_dir_size
    dir_size = N.value
    for child in N.children
        dir_size += computeTotal(child)
    end
    if dir_size >= space_needed && dir_size < best_dir_size
        best_dir_size = dir_size
    end
    return dir_size
end

root = Node(0, nothing, [])
current_node = root

# construct tree
for line in readlines("input.txt")
    global current_node
    global total_size
    if occursin("cd ..", line)
        current_node = current_node.parent
    elseif occursin("\$ cd", line)
        push!(current_node.children, Node(0, current_node, []))
        current_node = current_node.children[end]
    elseif occursin(r"[1-9]", line)
        current_node.value += parse(Int, first(split(line)))
        total_size += parse(Int, first(split(line)))
    end
end

space_needed = 30000000 - (70000000 - total_size)
computeTotal(root)
println(best_dir_size)