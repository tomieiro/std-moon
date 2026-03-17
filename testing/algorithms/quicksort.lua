package.path = "./?.lua;" .. package.path

local quicksort = require "algorithms.quicksort"

local list = { 3, 1, 2, 5, 4 }
local result = quicksort(list)

for i = 1, #result do
    assert(result[i] == i)
end

assert(#list == 5)
assert(list[1] == 3)
assert(list[5] == 4)

print("Quicksort test passed!")
