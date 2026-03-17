package.path = "./?.lua;" .. package.path

local Grafo = require "data_structures.grafo"

local grafo = Grafo:new()
grafo:addNo(1, "a")
grafo:addNo(2, "b")
grafo:addNo(3, "c")
grafo:addEdge(1, 2, 5)
grafo:addEdge(2, 3, 7)

assert(grafo.nos[1].adj[2] == 5)
assert(grafo.nos[2].adj[3] == 7)
assert(grafo:getValor(1) == "a")

grafo:removeEdge(1, 2)
assert(grafo.nos[1].adj[2] == nil)

grafo:addEdge(1, 2, 5)
grafo:removeNo(2)
assert(grafo.nos[2] == nil)
assert(grafo.nos[1].adj[2] == nil)

print("Grafo test passed!")
