package.path = "./?.lua;" .. package.path

local Arvore = require "data_structures.arvore_binaria"

local arvore = Arvore:new()
arvore:insert(2)
arvore:insert(1)
arvore:insert(3)
arvore:insert(4)

assert(arvore.raiz.valor == 2)
assert(arvore.raiz.NoEsq.valor == 1)
assert(arvore.raiz.NoDir.valor == 3)
assert(arvore.raiz.NoDir.NoDir.valor == 4)
assert(#arvore.itens == 4)

arvore:remove(4)
assert(arvore.raiz.NoDir.NoDir == 0)
assert(#arvore.itens == 3)

arvore:remove(2)
assert(arvore.raiz.valor == 3)
assert(arvore.raiz.NoEsq.valor == 1)
assert(#arvore.itens == 2)

local ok = pcall(function()
    arvore:print()
end)
assert(ok == true)

print("Arvore binaria test passed!")
