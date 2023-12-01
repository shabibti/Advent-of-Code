count = 0

for line in eachline("input.txt")
    global count
    bounds = parse.(Int, split(line, (',','-')))
    sign1 = sign(bounds[1] - bounds[3])
    sign2 = sign(bounds[2] - bounds[4])
    if (abs(sign1 + sign2) < 2) #one range contains the other if signs are either different or both zero
        count += 1
    end
end

println(count)