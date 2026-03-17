package.path = "./?.lua;" .. package.path

local Fila = require "data_structures.fila"

local fila_a = Fila:new()
local fila_b = Fila:new()

fila_a:push("a")
fila_a:push("b")

assert(fila_a:pop() == "a")
assert(fila_a:pop() == "b")
assert(fila_b.itens[1] == nil)
assert(fila_a.itens ~= fila_b.itens)

print("Fila test passed!")
