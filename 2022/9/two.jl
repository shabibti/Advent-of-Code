using DelimitedFiles

knots = fill((0,0), 10)
visited = [(0,0)]
move = Dict("U" => x->(x[1], x[2]+1), "D" => x->(x[1], x[2]-1), "R" => x->(x[1]+1, x[2]), "L" => x->(x[1]-1, x[2]))
lines = readdlm("input.txt")

function updatePosition(head, tail)
    if (abs(tail[1] - head[1]) > 1 || abs(tail[2] - head[2]) > 1)
        return (tail[1] + sign(head[1] - tail[1]), tail[2] + sign(head[2] - tail[2]))
    else
        return tail
    end
end

for row in eachrow(lines)
    direction, num = row
    for i in 1:num
        knots[1] = move[direction](knots[1])
        for j in 1:9 #updates to knot positions need to be done sequentially
            knots[j+1] = updatePosition(knots[j], knots[j+1])
        end
            if !(knots[10] in visited)
                push!(visited, knots[10])
            end
    end
end

println(length(visited))