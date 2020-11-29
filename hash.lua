--Definicao padrao dos atributos da Tabela Hash
TabelaHash = {tabela = {}, m = 0, tamanho = 0, _indexfirst = 1, _indexlast = 1};

--Metodo cosntrutor que instancia o objeto TabelaHash.
--args: (Table) Atributos desejados para a TabelaHash.
--args: (int) m = tamanho estático da tabela hash.
--return: (Object) TabelaHash instanciada.
function TabelaHash:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    self.m = 1000000;
    self._indexlast = self._indexfirst + self.m - 1;
    for i=1, self.m do
        self.tabela[i] = nil;
    end
    return atributos;
end

--Metodo append que insere um objeto do tipo inteiro na TabelaHash.
--args: (Object) Objeto desejado para incluir na TabelaHash.
function TabelaHash:insert(key)
    if type(key) ~= "number" then
        error("Argumento nao é um numero");
        return;
    end
    --if(key < 0) then
        --error("Argumento nao é um numero inteiro positivo");
        --return;
    --end
    local A = (math.sqrt(5)-1)/2.0;
    local pos;
    local k = -1;
    repeat
		k = k + 1;
		--pos = hash_division(key, m, k);
        pos = hash_multi(key, A, self.m, k);
        local aux = self.tabela[pos];
        if (aux ~= nil) then
            print("Colisão ", self.tabela[pos]);
        end
    until(aux ~= nil)
    print(pos)
    table.insert(self.tabela, pos, key);
    self.tamanho = self.tamanho + 1;
    return;
end

--Funcao que remove o elemento com o valor especificado.
--args: (Object) elemento a ser identificado na tabela hash.
function TabelaHash:remove(key)
    local pos = hash_search(self.tabela, key, self.m);
    if(pos < 0) then
        return pos;
    end
    self.tabela[pos] = nil;
    self.tamanho = self.tamanho - 1;
    return;
end



return Lista;