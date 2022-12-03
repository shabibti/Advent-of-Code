sum = 0

for line in eachline("input.txt")
    global sum
    split_index = Int(length(line) / 2)
    comp1 = chop(line, tail=split_index)
    comp2 = chop(line, head=split_index, tail=0)
    item_type = intersect(comp1, comp2)[1]
    if (Int(item_type) < 97) #item type is uppercase
        sum += (item_type - 'A') + 27
    else #item type must be lowercase
        sum += (item_type - '`')
    end
end

println(sum)