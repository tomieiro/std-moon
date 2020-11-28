local lib = require("fila_prioridade");
function comp( obj_a, obj_b )
    return obj_a > obj_b;
end

f_prioridade = Fila_Prioridade:new( {},comp);

for i=1, 4 do
    for j=1, 4 do
        f_prioridade:push(((i * j *1.25 )));
        print((i * j)*1.25);
    end
end

print("ja ordenado:");
f_prioridade:print();

f_prioridade:free();