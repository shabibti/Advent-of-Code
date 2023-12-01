using DelimitedFiles

head, tail = (0,0), (0,0)
visited = [(0,0)]
move = Dict("U" => x->(x[1], x[2]+1), "D" => x->(x[1], x[2]-1), "R" => x->(x[1]+1, x[2]), "L" => x->(x[1]-1, x[2]))
lines = readdlm("input.txt")

for row in eachrow(lines)
    global head, tail
    direction, num = row
    for i in 1:num
        head = move[direction](head)
        if (abs(tail[1] - head[1]) > 1 || abs(tail[2] - head[2]) > 1)
            tail = (tail[1] + sign(head[1] - tail[1]), tail[2] + sign(head[2] - tail[2]))
            if !(tail in visited)
                push!(visited, tail)
            end
        end
    end
end

println(length(visited))