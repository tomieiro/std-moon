package.path = "./?.lua;" .. package.path

local AVL = require "data_structures.avl"

local function testa_balanceamento(valores)
    local arvore = AVL:new()
    for _, valor in ipairs(valores) do
        arvore:add(valor)
    end
    assert(arvore.raiz.valor == 2)
    assert(arvore.raiz.no_esq.valor == 1)
    assert(arvore.raiz.no_dir.valor == 3)
end

testa_balanceamento({3, 2, 1})
testa_balanceamento({1, 2, 3})
testa_balanceamento({3, 1, 2})
testa_balanceamento({1, 3, 2})

local arvore = AVL:new()
for _, valor in ipairs({2, 1, 3}) do
    arvore:add(valor)
end

local ok = pcall(function()
    arvore:print()
end)
assert(ok == true)

arvore.raiz = arvore.raiz:removeNo(1)
assert(arvore.raiz.valor == 2)
assert(arvore.raiz.no_esq == nil)
assert(arvore.raiz.no_dir.valor == 3)

local vazia = AVL:new()
local vazia_ok = pcall(function()
    vazia:print()
end)
assert(vazia_ok == false)

print("AVL test passed!")
