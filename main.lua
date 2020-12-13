local lib = require("mapa");

mapa = lib:new();


for i=1, 2 do
    for j=1, 2 do
        mapa:push("vini"..(i*2)+(j*3) , i*j + 5);
        print("elemento adicionado: ")
        print(mapa:getByKey("vini"..(i*2)+j*3));
    end
end

print("----------------------------------------------");
mapa:print();
print("----------------------------------------------");
mapa:remove("vini"..5);
mapa:print();

mapa:free();