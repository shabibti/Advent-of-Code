lines = [ eval(Meta.parse(line)) for line in filter(!isempty, readlines("input.txt")) ]

function isLessThan(A, B)
    queue_A = copy(A)
    queue_B = copy(B)

    if typeof(queue_A) == Int
        queue_A = [A]
    end
    if typeof(queue_B) == Int
        queue_B = [B]
    end
        
    while !isempty(queue_A) && !isempty(queue_B)
        elem_A, elem_B = popfirst!(queue_A), popfirst!(queue_B)

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

    if length(queue_A) != length(queue_B)
        return length(queue_A) < length(queue_B)
    end
end

index_2 = 1
index_6 = 2

for elem in lines
    global index_2, index_6
    if isLessThan(elem, [[2]])
        index_2 += 1
    end
    if isLessThan(elem, [[6]])
        index_6 += 1
    end
end

println(index_2*index_6)