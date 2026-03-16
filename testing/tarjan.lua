package.path = "./?.lua;" .. package.path

local tarjan = require "algorithms.tarjan"

local graph = {
    { 2 },
    { 1, 3 },
    { 4 },
    { 3 },
    {}
}

local componentes = tarjan.tarjan(graph)
local sizes = {}

for i = 1, #componentes do
    sizes[#sizes + 1] = #componentes[i]
end

table.sort(sizes)

assert(#componentes == 3)
assert(sizes[1] == 1)
assert(sizes[2] == 2)
assert(sizes[3] == 2)

print("Tarjan test passed!")
