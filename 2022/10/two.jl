X = 1
current_cycle = 0
string = ""

function incrementCycle()
    global X, current_cycle, string
    current_cycle += 1
    string *= abs(mod(current_cycle-1, 40) - X) > 1 ? "." : "#"
    if mod(current_cycle, 40) == 0
        println(string)
        string = ""
    end
end

for line in readlines("input.txt")
    global X
    incrementCycle()
    if occursin(r"[1-9]", line)
        incrementCycle()
        X += parse(Int, split(line)[2])
    end
end