package.path = "./?.lua;" .. package.path

local dj = require "algorithms.djisktra"

local graph = { { 0, 4, 0, 0, 0, 0, 0, 8, 0 },
                { 4, 0, 8, 0, 0, 0, 0, 11, 0 },
                { 0, 8, 0, 7, 0, 4, 0, 0, 2 },
                { 0, 0, 7, 0, 9, 14, 0, 0, 0 },
                { 0, 0, 0, 9, 0, 10, 0, 0, 0 },
                { 0, 0, 4, 14, 10, 0, 2, 0, 0 },
                { 0, 0, 0, 0, 0, 2, 0, 1, 6 },
                { 8, 11, 0, 0, 0, 0, 1, 0, 7 },
                { 0, 0, 2, 0, 0, 0, 6, 7, 0 } };
local distance, paths = dj.djikstra(graph, 1, 9)

-- Check if the result is correct
assert(distance == 14)

-- Path: 1 -> 2 -> 3 -> 9
assert(paths[9] == 3)
assert(paths[3] == 2)
assert(paths[2] == 1)

print("Djikstra path test passed!")

local graph_unreachable = { { 0, 1, 0 },
                            { 1, 0, 0 },
                            { 0, 0, 0 } };
local distance_unreachable, paths_unreachable = dj.djikstra(graph_unreachable, 1, 3)

assert(distance_unreachable == math.huge)
assert(paths_unreachable[3] == nil)

print("Djikstra unreachable test passed!")
