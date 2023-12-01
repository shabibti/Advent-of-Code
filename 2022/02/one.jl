score = 0
outcome = Dict{Int,Int}(22=>0, 25=>0, 23=>3, 21=>6, 24=>6) #points gained from matchup with opponent

for line in eachline("input.txt")
    global score
    their_move = line[1]
    my_move = line[3]
    # use hacky character arithmetic to calculate the score in fewer steps
    score += outcome[my_move - their_move]  + (my_move - 'W') #score = points from round outcome + points from chosen shape
end

print(score)