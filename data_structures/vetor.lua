--Definicao padrao dos atributos do Vetor
Vetor = {itens = {}, _iterator = 1};

--Metodo construtor que instancia o objeto Vetor.
--args: (Table) Atributos desejados para o Vetor.
--return: (Object) Vetor instanciado.
function Vetor:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    return atributos;
  end


--Metodo insert que insere um objeto no Vetor.
--args: (Object) Objeto desejados para incluir no Vetor.
function Vetor:insert(objeto)
    table.insert(self.itens,#self.itens + 1,objeto);
    return;
end


--Metodo at que acessa um objeto do Vetor.
--args: (Int) Indice qual se deseja acessar
--return: (Object) Objeto acessado do Vetor.
function Vetor:at(index)
    if index > #self.itens or index < 1 then
        error("Acesso indevido a uma posicao fora do vetor.");
    end
    return self.itens[index];
end

--Metodo que retorna o tamanho do Vetor.
--return: (Int)Tamanho do Vetor.
function Vetor:tam()
    return #self.itens
end

--Metodo front que acessa o primeiro objeto do Vetor.
--return: (Object) Objeto da primeira posicao do Vetor.
function Vetor:front()
    return self.itens[1];
end

--Metodo back que acessao ultimo objeto do Vetor.
--return: (Object) Objeto da ultima posicao do Vetor.
function Vetor:back()
    return self.itens[#self.itens];
end

--Metodo begin que seta o iterador para o primeira posicao do Vetor.
function Vetor:begin()
    self._iterator = 0;
    return;
end

--Metodo finale que seta o iterador para a ultima posicao do Vetor.
function Vetor:finale()
    self._iterator = #self.itens + 1;
    return;
end

--Metodo setIt que seta o iterador para uma posicao arbitraria do Vetor.
--args: (Int) Indice qual se deseja setar o iterador.
function Vetor:setIt(index)
    self._iterator = index;
    return;
end

--Metodo after que busca o proximo elemento do vetor baseando-se no iterador.
--return: (Object) Objeto da posicao iterada.
function Vetor:after()
    if self._iterator >= #self.itens then
        error("Acesso indevido a uma posicao fora do vetor.");
    end
    self._iterator = self._iterator + 1;
    return self.itens[self._iterator];
end

--Metodo before que busca o elemento anterior do vetor baseando-se no iterador.
--return: (Object) Objeto da posicao iterada.
function Vetor:before()
    if self._iterator <= 1 then
        error("Acesso indevido a uma posicao fora do vetor.");
    end
    self._iterator = self._iterator - 1;
    return self.itens[self._iterator];
end


--Metodo swap que troca todo conteudo do Vetor pelo conteudo de outro Vetor.
--args: (Vetor) Vetor base para o swap
--return: (Int) Numero de posicoes copiadas
function Vetor:swap(vetor_base)
    local tam = #vetor_base;
    if #vetor_base > #self.itens then tam = #self.itens end
    for i=1, tam do
        self.itens[i] = vetor_base[i]
    end
    return;
end

--Metodo para liberar o Vetor
function Vetor:free()
    for i=1, #self.itens do
        self.itens[i] = nil;
    end
    local aux = {__mode = "k"}
    setmetatable(self.itens,aux);
    setmetatable(self, aux);
    self = nil;
    collectgarbage();
end


return Vetor;
