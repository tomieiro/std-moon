package.path = "./?.lua;" .. package.path

local dj = require "algorithms.dijkstra"
local Grafo = require "data_structures.grafo"

local graph = Grafo:new()

for i = 1, 9 do
    graph:addNo(i, i)
end

graph:addEdge(1, 2, 4)
graph:addEdge(1, 8, 8)
graph:addEdge(2, 1, 4)
graph:addEdge(2, 3, 8)
graph:addEdge(2, 8, 11)
graph:addEdge(3, 2, 8)
graph:addEdge(3, 4, 7)
graph:addEdge(3, 6, 4)
graph:addEdge(3, 9, 2)
graph:addEdge(4, 3, 7)
graph:addEdge(4, 5, 9)
graph:addEdge(4, 6, 14)
graph:addEdge(5, 4, 9)
graph:addEdge(5, 6, 10)
graph:addEdge(6, 3, 4)
graph:addEdge(6, 4, 14)
graph:addEdge(6, 5, 10)
graph:addEdge(6, 7, 2)
graph:addEdge(7, 6, 2)
graph:addEdge(7, 8, 1)
graph:addEdge(7, 9, 6)
graph:addEdge(8, 1, 8)
graph:addEdge(8, 2, 11)
graph:addEdge(8, 7, 1)
graph:addEdge(8, 9, 7)
graph:addEdge(9, 3, 2)
graph:addEdge(9, 7, 6)
graph:addEdge(9, 8, 7)

local distance, paths = dj.dijkstra(graph, 1, 9)

assert(distance == 14)
assert(paths[9] == 3)
assert(paths[3] == 2)
assert(paths[2] == 1)

local graph_unreachable = Grafo:new()
graph_unreachable:addNo(1, 1)
graph_unreachable:addNo(2, 2)
graph_unreachable:addNo(3, 3)
graph_unreachable:addEdge(1, 2, 1)
graph_unreachable:addEdge(2, 1, 1)

local distance_unreachable, paths_unreachable = dj.dijkstra(graph_unreachable, 1, 3)

assert(distance_unreachable == math.huge)
assert(paths_unreachable[3] == nil)

print("Dijkstra test passed!")
