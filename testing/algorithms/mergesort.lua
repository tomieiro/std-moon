package.path = "./?.lua;" .. package.path

local mergesort = require "algorithms.mergesort"

local list = { 1, 3, 2, 5, 4, 7, 6, 9, 8, 10 }
local result = mergesort.mergeSort(list)

for i = 1, #result do
    assert(result[i] == i)
end

local ok = pcall(function()
    mergesort.mergeSort("invalido")
end)

assert(ok == false)

print("Mergesort test passed!")
