package.path = "./?.lua;" .. package.path

local Lista = require "data_structures.lista"

local lista = Lista:new()
lista:append(3)
lista:append(1)
lista:insert(2, 2)

assert(lista:count() == 3)
assert(lista.itens[2] == 2)
assert(lista:index(1) == 3)

local copia = lista:copy()
assert(copia[1] == 3)
assert(copia ~= lista.itens)

lista:sort()
assert(lista.itens[1] == 1)
assert(lista.itens[2] == 2)
assert(lista.itens[3] == 3)

lista:reverse()
assert(lista.itens[1] == 3)
assert(lista.itens[2] == 2)
assert(lista.itens[3] == 1)

lista:remove(2)
assert(lista:count() == 2)
assert(lista:index(2) == -1)

lista:clear()
assert(lista:count() == 0)

print("Lista test passed!")
