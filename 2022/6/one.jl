input = first(readlines("input.txt"))

for i in 4:length(input)
    if (length(unique(input[i-3:i])) == 4)
        println(i)
        break
    end
end