coords = [ [(parse.(Int, m)) for m in s] for s in collect.(eachmatch.(r"(?<x>\d+),(?<y>\d+)", readlines("input.txt"))) ]
occupied = Set{Vector{Int}}([])

# add cells with rocks into list of occupied spaces
for line in coords
    current_coords = line[1]
    for vec in line[begin+1:end] - line[begin:end-1]
        sign_x, sign_y = sign.(vec)
        for dx = 0:abs(vec[1]), dy = 0:abs(vec[2])
            push!(occupied, [current_coords[1] + sign_x*dx, current_coords[2] + sign_y*dy])
        end
        current_coords += vec
    end
end

sand_count = 0
sand_coords = [500,0]
max_y = maximum(getindex.(collect(Iterators.flatten(coords)), 2)) + 1

# evolve sand
while sand_coords[2] != max_y
    global sand_count, sand_coords

    if length(intersect(occupied, [sand_coords] .+ [[0,1],[-1,1],[1,1]])) == 3
        push!(occupied, sand_coords)
        sand_count += 1
        sand_coords = [500,0]
    elseif !([sand_coords[1],sand_coords[2]+1] in occupied)
        sand_coords += [0,1]
    elseif !([sand_coords[1]-1,sand_coords[2]+1] in occupied)
        sand_coords += [-1,1]
    else
        sand_coords += [1,1]
    end
end

println(sand_count)