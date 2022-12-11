mutable struct Monkey
    items::Vector{Int}
    test::Int
    index::Dict{Bool, Int}
    inspect_count::Int
    operation
end

lines = readlines("input.txt")
monkeys = Monkey[]

for i in findall(x->occursin("Monkey", x), lines)
    items = [ parse(Int, s.match) for s in collect(eachmatch(r"\d+", lines[i+1])) ]
    operation = eval(Meta.parse("x->"*replace(split(lines[i+2], "= ")[end], "old"=>"x")))
    test = parse(Int, split(lines[i+3])[end])
    index = Dict([(true, parse(Int, split(lines[i+4])[end])+1), (false, parse(Int, split(lines[i+5])[end])+1)])
    push!(monkeys, Monkey(items, test, index, 0, operation))
end

mod_base = prod([m.test for m in monkeys])

for _ in 1:10000
     for i in 1:length(monkeys)
        current_m = monkeys[i]
        current_m.inspect_count += length(current_m.items)
        while (!isempty(current_m.items))
            worry_level = mod(current_m.operation(popfirst!(current_m.items)), mod_base)
            push!(monkeys[current_m.index[worry_level % current_m.test == 0]].items, worry_level)
        end
     end
end

println(prod(sort!([m.inspect_count for m in monkeys])[end-1:end]))