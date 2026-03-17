package.path = "./?.lua;" .. package.path

local Matriz = require "data_structures.matriz"

local matriz = Matriz:new({}, 2, 2)
matriz:setPos(10, 1, 1)
matriz:setPos(20, 1, 2)
matriz:setPos(30, 2, 1)
matriz:setPos(40, 2, 2)

assert(matriz:getPos(1, 1) == 10)
assert(matriz:getLine(1)[2] == 20)
assert(matriz:getCol(1)[2] == 30)

matriz:swap(1, 1, 2, 2)
assert(matriz:getPos(1, 1) == 40)
assert(matriz:getPos(2, 2) == 10)

print("Matriz test passed!")
