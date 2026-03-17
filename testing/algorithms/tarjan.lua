package.path = "./?.lua;" .. package.path

local tarjan = require "algorithms.tarjan"
local Grafo = require "data_structures.grafo"

local graph = Grafo:new()

for i = 1, 5 do
    graph:addNo(i, i)
end

graph:addEdge(1, 2, 1)
graph:addEdge(2, 1, 1)
graph:addEdge(2, 3, 1)
graph:addEdge(3, 4, 1)
graph:addEdge(4, 3, 1)

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
