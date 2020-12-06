--Definicao padrao dos atributos da Mapa
Mapa = {itens = {}, size = 0,  _indexfirst = 1, _indexlast = 1};

--Metodo cosntrutor que instancia o objeto Mapa.
--args: (Table) Atributos desejados para o Mapa.
--return: (Object) Mapa instanciado.
function Mapa:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    return atributos;
end

--Metodo push que insere um objeto e uma chave no Mapa.
--args: (Object) Objeto desejados para incluir no Mapa.
function Mapa:push(chave, objeto)
    local aux = {chave, objeto}
    self.size = self.size +1; 
    table.insert(self.itens,self._indexlast,aux);
    self._indexlast = self._indexlast + 1;
    return;
end

--Metodo pop que remove um objeto da primeira posição
--return: (Object) Objeto removido do mapa
function Mapa: pop()
    self.size = self.size -1;
    self. _indexfirst = self. _indexfirst +1;
    return table.remove(self.itens,self. _indexfirst -1);
end

--Metodo get que retorna o primeiro objeto com a chave desejada.
--args: (Object) chave que esta sendo buscada.
--return: (Object) Objeto encontrado que possui a chave desejada.
function Mapa: getByKey(chave)
    local aux;
    for i=self._indexfirst, self._indexlast do
        aux = self.itens[i];
        if(aux[1] == chave) then
            return aux;
        end
    end
    return nil;
end

--Metodo set que procura e altera o primeiro objeto com a chave desejada
--args: (Object) chave que esta sendo  buscada; nova chave que vai substuir a antiga; novo objeto que vai substituir o antigo.
function Mapa: setByKey(chave,nova_chave,novo_objeto)
    local aux;
    for i=self._indexfirst, self._indexlast do
        aux = self.itens[i];
        if(aux[1] == chave) then
            self.itens[i] = {nova_chave,novo_objeto};
            return;
        end
    end
end

--Metodo para liberar o Mapa
function Mapa:free()
    for i=self._indexfirst, self._indexlast do
        self.itens[i] = nil;
    end
    local aux = {__mode = "k"}
    setmetatable(self.itens,aux);
    setmetatable(self, aux);
    self = nil;
    collectgarbage();
end


return Mapa;