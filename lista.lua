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

--Funcao que printa toda a lista
function Lista:print()
    for i=self._indexfirst, self._indexlast - 1 do
        print(self.itens[i]);
    end
    return;
end

--Funcao que retorna a quantidade de elementos na lista
--return: (Int) Quantidade de elementos da lista.
function Lista:count()
    return self.tamanho;
end

--Funcao que extende uma lista em outra. Concatena no fim.
--Ou seja, adiciona a lista_base no fim da lista.
--args: (Lista) Lista a ser adicionada.
function Lista:extend(lista_base)
    local tam = lista_base:count();
    for i=0, tam do
        self:append(lista_base:pop(i));
    end
    return;
end

--Funcao que remove todos os elementos de uma Lista.
function Lista:clear()
    local tam = lista_base:count();
    for i=0, self.tamanho do
        self:pop(i);
    end
    return;
end

--Funcao que retorna o índice do primeiro elemento com o valor especificado.
--args: (Object) elemento a ser identificado na lista.
--return: (Int) Índice correspondente. Quando não há um elemento, retorna -1;
function Lista:index(elemento)
    local tam = lista_base:count();
    for i=0, self.tamanho do
        if(self.itens[i] == elemento)
            return i
        end
    end
    return -1;
end

--Funcao que remove o primeiro elemento com o valor especificado.
--args: (Object) elemento a ser identificado na lista.
function Lista:remove(elemento)
    local tam = lista_base:count();
    for i=0, self.tamanho do
        if(self.itens[i] == elemento)
            self:pop(i);
        end
    end
    return;
end


--Metodo para liberar a Lista
function Lista:free()
    for i=self._indexfirst, self._indexlast - 1 do
        self.itens[i] = nil;
    end
    local aux = {__mode = "k"}
    setmetatable(self.itens,aux);
    setmetatable(self, aux);
    self = nil;
    collectgarbage();
end

return Lista;