mutable struct Node
    value::Int
    parent
    children::Vector{Node}
end

big_sum = 0
function computeTotal(N::Node)
    global big_sum
    total_size = N.value
    for child in N.children
        total_size += computeTotal(child)
    end
    if (total_size <= 100000)
        big_sum += total_size
    end
    return total_size
end

root = Node(0, nothing, [])
current_node = root

# construct tree
for line in readlines("input.txt")
    global current_node
    if occursin("cd ..", line)
        current_node = current_node.parent
    elseif occursin("\$ cd", line)
        push!(current_node.children, Node(0, current_node, []))
        current_node = current_node.children[end]
    elseif occursin(r"[1-9]", line)
        current_node.value += parse(Int, first(split(line)))
    end
end

computeTotal(root)
println(big_sum)