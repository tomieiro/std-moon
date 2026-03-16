package.path = "./?.lua;" .. package.path

local insertionsort = require "algorithms.insertionsort"

local list = { 5, 3, 4, 1, 2 }
local result = insertionsort(list)

for i = 1, #result do
    assert(result[i] == i)
end

local ok = pcall(function()
    insertionsort({ 1, "x", 2 })
end)

assert(ok == false)

print("Insertionsort test passed!")
