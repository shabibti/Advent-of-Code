input = first(readlines("input.txt"))

for i in 14:length(input)
    if (length(unique(input[i-13:i])) == 14)
        println(i)
        break
    end
end