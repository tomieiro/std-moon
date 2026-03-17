package.path = "./?.lua;" .. package.path

local Vetor = require "data_structures.vetor"

local vetor = Vetor:new()
vetor:insert(10)
vetor:insert(20)
vetor:insert(30)

assert(vetor:tam() == 3)
assert(vetor:at(1) == 10)
assert(vetor:front() == 10)
assert(vetor:back() == 30)

vetor:begin()
assert(vetor:after() == 10)
assert(vetor:after() == 20)

vetor:finale()
assert(vetor:before() == 30)

vetor:swap({ 1, 2, 3 })
assert(vetor:at(1) == 1)
assert(vetor:at(2) == 2)
assert(vetor:at(3) == 3)

print("Vetor test passed!")
