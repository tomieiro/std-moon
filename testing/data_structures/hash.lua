package.path = "./?.lua;" .. package.path

local TabelaHash = require "data_structures.hash"

local hash = TabelaHash:new({m = 10})

hash:insert(1)
hash:insert(2)
assert(hash.tamanho == 2)

hash:remove(1)
assert(hash.tamanho == 1)
assert(hash:remove(99) == -1)

hash:clear()
assert(hash.tamanho == 0)

for i = 1, hash.m do
    assert(hash.tabela[i] == nil)
end

hash:insert(3)
assert(hash.tamanho == 1)

print("Hash test passed!")
