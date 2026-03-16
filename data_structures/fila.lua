--Definicao padrao dos atributos da Fila
Fila = {itens = {}, tamanho = 0, _indexfirst = 1, _indexlast = 1};

--Metodo cosntrutor que instancia o objeto Fila.
--args: (Table) Atributos desejados para a Fila.
--return: (Object) Fila instanciada.
function Fila:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    return atributos;
  end


--Metodo push que insere um objeto na Fila.
--args: (Object) Objeto desejados para incluir na Fila.
function Fila:push(objeto)
    table.insert(self.itens,self._indexlast,objeto);
    self.tamanho = self.tamanho + 1;
    self._indexlast = self._indexlast + 1;
    return;
end


--Metodo pop que remove um objeto da Fila.
--return: (Object) Objeto removida da Fila.
function Fila:pop()
    self._indexfirst = self._indexfirst + 1;
    local aux = self.itens[self._indexfirst - 1];
    self.itens[self._indexfirst - 1] = nil;
    self.tamanho = self.tamanho - 1;
    collectgarbage();
    return aux;
end

--Funcao que printa toda a lista
function Fila:print()
    for i=self._indexfirst, self._indexlast - 1 do
        print(self.itens[i])
    end
    return;
end

--Metodo para liberar a Fila
function Fila:free()
    for i=self._indexfirst, self._indexlast - 1 do
        self.itens[i] = nil;
    end
    local aux = {__mode = "k"}
    setmetatable(self.itens,aux);
    setmetatable(self, aux);
    self = nil;
    collectgarbage();
end


return Fila;
