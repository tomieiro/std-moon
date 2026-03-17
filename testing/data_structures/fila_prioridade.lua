package.path = "./?.lua;" .. package.path

local Fila_Prioridade = require "data_structures.fila_prioridade"

local fila_a = Fila_Prioridade:new({}, function(x, y) return x < y end)
local fila_b = Fila_Prioridade:new({}, function(x, y) return x > y end)

fila_a:push(3)
fila_a:push(1)
fila_a:push(2)

assert(fila_a:pop() == 1)
assert(fila_a:pop() == 2)
assert(fila_a:pop() == 3)
assert(fila_b.itens[1] == nil)
assert(fila_a.itens ~= fila_b.itens)
assert(fila_a.comp_func ~= fila_b.comp_func)

print("Fila prioridade test passed!")
