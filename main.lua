local Lista = require("lista");

lista = Lista:new();

lista:append("ok");
lista:append("PP");
lista:append({loc="op",tto="o"});

local b = {};
b = lista:copy()
lista:print();
print()
for i,j in pairs(b) do
  print(j)
end
lista:free();
