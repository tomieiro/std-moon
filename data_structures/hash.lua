function hash_multi(key, a, m, k)
    local val = (key+(k*k))*a;
    --print(val)
    val = val - math.floor(val);
    --print(val)
    --print(val*m)
	return math.floor(val*m);
end

function hash_search(t, key, m)
	local a = (math.sqrt(5)-1)/2.0;
    local pos;
    for k = 0, m - 1 do
		pos = hash_multi(key, a, m, k);
        if (t[pos] == key) then
            return pos;
        end
        if (t[pos] == nil) then
            return -1;
        end
        if (t[pos] ~= key) then
            print("Colisao ", t[pos]);
        end
    end
    return -1;
end

--Definicao padrao dos atributos da Tabela Hash
TabelaHash = {tabela = {}, m = 0, tamanho = 0, _indexfirst = 1, _indexlast = 1};

--Metodo cosntrutor que instancia o objeto TabelaHash.
--args: (Table) Atributos desejados para a TabelaHash.
--args: (int) m = tamanho estático da tabela hash.
--return: (Object) TabelaHash instanciada.
function TabelaHash:new(atributos)
    atributos = atributos or {};
    self.__index = self;
    atributos.tabela = atributos.tabela or {};
    atributos.m = atributos.m or 1000000;
    atributos.tamanho = atributos.tamanho or 0;
    atributos._indexfirst = atributos._indexfirst or 1;
    atributos._indexlast = atributos._indexfirst + atributos.m - 1;
    setmetatable(atributos, self);
    for i=1, atributos.m do
        atributos.tabela[i] = nil;
        --table.insert(self.tabela, 1, nil);
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
        --print(pos)
        local aux = self.tabela[pos];
        --print(aux)
        if (aux ~= nil) then
            print("Colisão ", self.tabela[pos]);
        end
    until(not aux)
    --print(pos)
    self.tabela[pos] = key;
    --table.insert(self.tabela, pos, key);
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

--Funcao que remove todos os elementos de uma tabela hash.
function TabelaHash:clear()
    for i=1, self.m do
        self.tabela[i] = nil;
    end
    self.tamanho = 0;
    return;
end

--Funcao que printa toda a hash
function TabelaHash:print()
    for i=1, self.m do
        if self.tabela[i] ~= nil then
            print("Elemento ",self.tabela[i], " na posição ", i, ".");
        end
    end
    return;
end

--Metodo para liberar a TabelaHash
function TabelaHash:free()
    for i=self._indexfirst, self._indexlast - 1 do
        self.tabela[i] = nil;
    end
    local aux = {__mode = "k"}
    setmetatable(self.tabela,aux);
    setmetatable(self, aux);
    self = nil;
    collectgarbage();
end


return TabelaHash;
