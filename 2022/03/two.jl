sum = 0
lines = readlines("input.txt")

for i in 0:(Int(length(lines)/3) - 1)
    global sum
    front_ind = 3*i + 1
    item_type = intersect(lines[front_ind], lines[front_ind+1], lines[front_ind+2])[1]
    if (Int(item_type) < 97) #item type is uppercase
        sum += (item_type - 'A') + 27
    else #item type must be lowercase
        sum += (item_type - '`')
    end
end

println(sum)