local lib = require("mapa");

mapa =  Mapa:new( );


for i=1, 2 do
    for j=1, 2 do
        mapa:push((i*2)+j, i*j + 5);
        print("elemento adicionado: ")
        print(mapa:getByKey((i*2)+j)[1]);
        print(mapa:getByKey((i*2)+j)[2]);
    end
end

print("----------------------------------------------");
mapa:print();
print("----------------------------------------------");
mapa:pop();
mapa:print();

mapa:free();