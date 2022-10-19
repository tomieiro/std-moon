--Definicao padrao dos atributos da Fila_Prioridade
Fila_Prioridade = {itens = {}, tamanho = 0, _indexfirst = 1, _indexlast = 1, comp_func = nil};

--Metodo cosntrutor que instancia o objeto Fila_Prioridade.
--args: (Table) Atributos desejados para a Fila_Prioridade, (function) funcao de comparacao de objetos.
--return: (Object) Fila_Prioridade instanciada.
function Fila_Prioridade:new(atributos, func)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    if(type(func) ~= "function") then
        error("Segundo parametro não é uma função.");
    end

    self.comp_func = func;

    return atributos;
end

function swap(indexA, indexB, fila_p)
    local aux = fila_p.itens[indexA];
    fila_p.itens[indexA] = fila_p.itens[indexB];
    fila_p.itens[indexB] = aux;
    return;
end


--Metodo push que insere um objeto na Fila_Prioridade.
--args: (Object) Objeto desejados para incluir na Fila_Prioridade.
function Fila_Prioridade:push(objeto)
    table.insert(self.itens,self._indexlast,objeto);
    self.tamanho = self.tamanho + 1;
    self._indexlast = self._indexlast + 1;

    local temp_index = self._indexlast-1;
    while (temp_index > 1 and  self.comp_func(self.itens[temp_index], self.itens[temp_index -1])) do
        swap(temp_index -1, temp_index, self);
        temp_index = temp_index - 1;
    end

    return;
end


--Metodo pop que remove um objeto da Fila_Prioridade.
--return: (Object) Objeto removida da Fila_Prioridade.
function Fila_Prioridade:pop()
    self._indexfirst = self._indexfirst + 1;
    local aux = self.itens[self._indexfirst - 1];
    self.itens[self._indexfirst - 1] = nil;
    self.tamanho = self.tamanho - 1;
    collectgarbage();
    return aux;
end

--Funcao que printa toda a lista
function Fila_Prioridade:print()
    for i=self._indexfirst, self._indexlast - 1 do
        print(self.itens[i])
    end
    return;
end

--Metodo para liberar a Fila
function Fila_Prioridade:free()
    for i=self._indexfirst, self._indexlast - 1 do
        self.itens[i] = nil;
    end
    local aux = {__mode = "k"}
    setmetatable(self.itens,aux);
    setmetatable(self, aux);
    self = nil;
    collectgarbage();
end


return Fila_Prioridade;
