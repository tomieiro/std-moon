package.path = "./?.lua;" .. package.path

local bubblesort = require "algorithms.bubblesort"

local list = { 5, 1, 4, 2, 3 }
local result = bubblesort(list)

for i = 1, #result do
    assert(result[i] == i)
end

assert(result == list)

print("Bubblesort test passed!")
