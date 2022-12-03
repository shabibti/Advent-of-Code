score = 0
outcome_points = Dict{Int,Int}(88=>0, 89=>3, 90=>6)
symbol_points = Dict{Int,Int}(154=>1, 157=>1, 155=>2, 153=>3, 156=>3)

for line in eachline("input.txt")
    global score
    their_move = Int(line[1])
    outcome = Int(line[3])
    score += outcome_points[outcome] + symbol_points[their_move + outcome]
end

print(score)