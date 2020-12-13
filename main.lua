local lib = require("hash");

local aux = TabelaHash:new();

aux:print();

aux:insert(1);

aux:print();

aux:insert(3);
aux:insert(4);
aux:insert(984);
aux:insert(123);

aux:print();

aux:free();
