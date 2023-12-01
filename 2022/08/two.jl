# parse input into a single-digit Int matrix
text = readlines("input.txt")
M = parse.(Int, reshape(vcat(split.(text,"")...), (length(text[1]),length(text))))
high_score = 0

function countTrees(sub_M, height)
    count = findfirst(x -> x>=height, sub_M)
    if count == nothing
        return length(sub_M)
    else
        return count
    end
end

println(maximum([ countTrees(M[i+1:end, j], M[i,j]) * 
countTrees(reverse(M[begin:i-1, j]), M[i,j]) * 
countTrees(M[i, j+1:end], M[i,j]) *
countTrees(reverse(M[i, 1:j-1]), M[i,j]) 
for i in 1:size(M)[1], j in 1:size(M)[2] ]))