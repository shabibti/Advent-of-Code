X = 1
current_cycle = 0
strength_sum = 0

function incrementCycle()
    global X, current_cycle, strength_sum
    current_cycle += 1
    if mod(current_cycle, 40) == 20
        strength_sum += X*current_cycle
    end
end

for line in readlines("input.txt")
    global X, current_cycle
    incrementCycle()
    if occursin(r"[1-9]", line)
        incrementCycle()
        X += parse(Int, split(line)[2])
    end
    if current_cycle > 220
        break
    end
end

println(strength_sum)