local lib = require("mapa");

mapa =  Mapa:new( );


for i=1, 2 do
    for j=1, 2 do
        mat:setPos(i*j,i, j);
        print(mat:getPos(i,j));
    end
end

mat:swap(1,4,4,2);
print(mat:getPos(1,1));
print(mat:getPos(2,2));

mat:free();