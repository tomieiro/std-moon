--Definicao padrao dos atributos da Lista
Lista = {itens = {}, tamanho = 0, _indexfirst = 1, _indexlast = 1};

--Metodo cosntrutor que instancia o objeto Lista.
--args: (Table) Atributos desejados para a Lista.
--return: (Object) Lista instanciada.
function Lista:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    return atributos;
end

--Metodo append que insere um objeto no fim da Lista.
--args: (Object) Objeto desejados para incluir na Lista.
function Lista:append(objeto)
    table.insert(self.itens,self._indexlast,objeto);
    self.tamanho = self.tamanho + 1;
    self._indexlast = self._indexlast + 1;
    return;
end

--Metodo append que insere um objeto em uma posição específica da Lista.
--args: (Object) Objeto desejados para incluir na Lista.
--      (Int) Índice da posição para inserir na lista.
function Lista:insert(objeto, i)
    table.insert(self.itens,i,objeto);
    self.tamanho = self.tamanho + 1;
    self._indexlast = self._indexlast + 1;
    return;
end

--Metodo pop que remove um objeto específico da Lista.
--args: (Int) Índice da posição para remover da lista.
--return: (Object) Objeto removida da Lista.
function Lista:pop(i)
    self.tamanho = self.tamanho - 1;
    self._indexlast = self._indexlast - 1;
    return table.remove(self.itens,i);
end



return Lista;