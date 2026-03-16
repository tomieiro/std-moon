package.path = "./?.lua;" .. package.path

local Lista = require "data_structures.lista"
local Fila = require "data_structures.fila"
local Vetor = require "data_structures.vetor"

local lista_a = Lista:new()
local lista_b = Lista:new()
lista_a:append("x")

assert(lista_b.itens[1] == nil)
assert(lista_a.itens ~= lista_b.itens)

local fila_a = Fila:new()
local fila_b = Fila:new()
fila_a:push("x")

assert(fila_b.itens[1] == nil)
assert(fila_a.itens ~= fila_b.itens)

local vetor_a = Vetor:new()
local vetor_b = Vetor:new()
vetor_a:insert("x")

assert(vetor_b.itens[1] == nil)
assert(vetor_a.itens ~= vetor_b.itens)

print("Structures test passed!")
