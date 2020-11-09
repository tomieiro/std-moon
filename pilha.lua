--Definicao padrao dos atributos da Pilha
Pilha = {itens = {}, tamanho = 0, _indexfirst = 1, _indexlast = 1};

--Metodo construtor que instancia o objeto Pilha.
--args: (Table) Atributos desejados para a Pilha.
--return: (Object) Pilha instanciada.
function Pilha:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    return atributos;
  end


--Metodo push que insere um objeto na Pilha.
--args: (Object) Objeto desejados para incluir na Pilha.
function Pilha:push(objeto)
    table.insert(self.itens,self._indexlast,objeto);
    self.tamanho = self.tamanho + 1;
    self._indexlast = self._indexlast + 1;
    return;
end


--Metodo pop que remove um objeto da Pilha.
--return: (Object) Objeto removida da Pilha.
function Pilha:pop()
    self._indexlast = self._indexlast - 1;
    return table.remove(self.itens,self._indexlast + 1);
end

--Metodo para liberar a Pilha
function Pilha:free()
    for i=self._indexfirst, self._indexlast do
        self.itens[i] = nil;
    end
    self = nil;
    collectgarbage();
end


return Pilha;