# Identical to Part 1, but with start and end nodes swapped and edge directions reversed

M = reduce(vcat, permutedims.(collect.(readlines("input.txt"))))
source, goal = findfirst(x->x=='S', M), findfirst(x->x=='E', M)
M[source], M[goal] = 'a', 'z'

distance = fill(typemax(Int), size(M))
distance[goal] = 0

queue = vec(collect(CartesianIndices(M)))
while !isempty(queue)
    u = queue[argmin(distance[queue])]
    deleteat!(queue, findfirst(x -> x==u, queue))

    possible_neighbors = [(u[1]+1, u[2]), (u[1]-1, u[2]), (u[1], u[2]+1), (u[1], u[2]-1)]
    for neighbor in filter(x -> checkbounds(Bool,M,x...), possible_neighbors)
        if M[neighbor...] - M[u] >= -1 && distance[u] + 1 < distance[neighbor...]
            distance[neighbor...] = distance[u] + 1
        end
    end
end
    
println(minimum(filter(x -> x>0, distance[findall(x -> x=='a', M)])))