lines = readlines("input.txt")
index_count = 0

function isLessThan(A, B)
    if typeof(A) == Int
        A = [A]
    end
    if typeof(B) == Int
        B = [B]
    end
        
    while !isempty(A) && !isempty(B)
        elem_A, elem_B = popfirst!(A), popfirst!(B)

        if typeof(elem_A) == typeof(elem_B) == Int
            if elem_A > elem_B
                return false
            elseif elem_A < elem_B
                return true
            end
        else
            query = isLessThan(elem_A, elem_B)
            if !isnothing(query)
                return query
            end
        end
    end

    if length(A) != length(B)
        return length(A) < length(B)
    end
end

for i in 1:3:length(lines)
    global index_count
    left = eval(Meta.parse(lines[i]))
    right = eval(Meta.parse(lines[i+1]))

    if isLessThan(left, right)
        index_count += (i + 2) / 3
    end
end

println(index_count)