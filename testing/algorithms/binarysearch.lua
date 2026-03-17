package.path = "./?.lua;" .. package.path

local busca_binaria = require "algorithms.binarysearch"

local list = { 1, 3, 5, 7, 9 }

assert(busca_binaria(list, 1) == 1)
assert(busca_binaria(list, 5) == 3)
assert(busca_binaria(list, 9) == 5)
assert(busca_binaria(list, 4) == -1)
assert(busca_binaria({}, 1) == -1)

print("Binarysearch test passed!")
