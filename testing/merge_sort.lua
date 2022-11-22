local ms = require "Algorithms.mergesort"

local list = { 1, 3, 2, 5, 4, 7, 6, 9, 8, 10 }
local result = ms.mergeSort(list)

-- Check if the result is correct
for i = 1, #result do
    assert(result[i] == i)
end

print("Merge sort test passed!")
