# parse input into a single-digit Int matrix
text = readlines("input.txt")
M = parse.(Int, reshape(vcat(split.(text,"")...), (length(text[1]),length(text))))

println(sum([ all(x -> x<M[i,j], M[i+1:end, j]) || 
all(x -> x<M[i,j], M[begin:i-1,j]) || 
all(x -> x<M[i,j], M[i,begin:j-1]) || 
all(x -> x<M[i,j], M[i,j+1:end]) 
for i in 1:size(M)[1], j in 1:size(M)[2] ]))