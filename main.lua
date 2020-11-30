local Vetor = require("vetor");
local aux = Vetor:new();

aux:insert("test");
aux:insert(17);
aux:insert(true);
aux:insert("fim");

print("Item na posicao 1 do vetor: " .. aux:at(1)); --> Item na posicao 1 do vetor: test
print("Inicio do vetor: " .. aux:front()); --> Inicio do vetor: test
print("Final do vetor: " .. aux:back()) --> Final do vetor: fim

--Para printar a lista:
aux:begin()
for i=1, aux:tam() do
  print(aux:after()) -->test 17 true fim
end

aux:swap({1, "trocado", 124, false});

--Para printar a lista:
aux:finale()
for i=1, aux:tam() do
  print(aux:before()) -->false 124 trocado 1
end

aux:free();
aux = nil;
