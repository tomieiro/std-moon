package.path = "./?.lua;" .. package.path

local Pilha = require "data_structures.pilha"

local pilha_a = Pilha:new()
local pilha_b = Pilha:new()

pilha_a:push("a")
pilha_a:push("b")

assert(pilha_a:pop() == "b")
assert(pilha_a:pop() == "a")
assert(pilha_b.itens[1] == nil)
assert(pilha_a.itens ~= pilha_b.itens)

print("Pilha test passed!")
