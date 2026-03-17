local No = {NoEsq = 0, NoDir = 0, valor = 0}

function No:new(atributos)
    atributos = atributos or {};
    self.__index = self;
    atributos.NoEsq = atributos.NoEsq or 0;
    atributos.NoDir = atributos.NoDir or 0;
    setmetatable(atributos, self);
    return atributos;
end

function No:insert_filho(valor_filho)
    if(valor_filho < self.valor) then
        if(self.NoEsq == 0) then
            self.NoEsq = No:new({valor = valor_filho});
            return;
        end
        self.NoEsq:insert_filho(valor_filho);
        return;
    end

    if(self.NoDir == 0) then
        self.NoDir = No:new({valor = valor_filho});
        return;
    end
    self.NoDir:insert_filho(valor_filho);
end

function No:getMinValueNode()
    local atual = self
    while atual.NoEsq ~= 0 do
        atual = atual.NoEsq
    end
    return atual
end

function No:remove_filho(valor_filho)
    if(valor_filho < self.valor) then
        if(self.NoEsq ~= 0) then
            self.NoEsq = self.NoEsq:remove_filho(valor_filho);
        end
        return self;
    end

    if(valor_filho > self.valor) then
        if(self.NoDir ~= 0) then
            self.NoDir = self.NoDir:remove_filho(valor_filho);
        end
        return self;
    end

    if(self.NoEsq == 0 and self.NoDir == 0) then
        return 0;
    end

    if(self.NoEsq == 0) then
        return self.NoDir;
    end

    if(self.NoDir == 0) then
        return self.NoEsq;
    end

    local temp = self.NoDir:getMinValueNode();
    self.valor = temp.valor;
    self.NoDir = self.NoDir:remove_filho(temp.valor);
    return self;
end

function No:print()
    if(self.NoEsq ~= 0) then
        self.NoEsq:print();
    end

    print(self.valor);

    if(self.NoDir ~= 0) then
        self.NoDir:print();
    end
end


Arvore = {itens = {}, profundidade = 0, raiz = 0};

--Metodo construtor que instancia o objeto Arvore Binaria.
--args: (Table) Atributos desejados para a arvore.
--return: (Object) Lista instanciada.
function Arvore:new(atributos)
    atributos = atributos or {};
    self.__index = self;
    atributos.itens = atributos.itens or {};
    atributos.profundidade = atributos.profundidade or 0;
    atributos.raiz = atributos.raiz or 0;
    setmetatable(atributos, self);
    return atributos;
end

function Arvore:insert(elem)
    if(self.raiz == 0) then
        self.raiz = No:new({valor = elem});
        self.profundidade = 1;
    else
        self.raiz:insert_filho(elem);
    end
    table.insert(self.itens, elem);
end

function Arvore:remove(elem)
    if(self.raiz == 0) then
        return;
    end

    local tamanho_anterior = #self.itens;
    self.raiz = self.raiz:remove_filho(elem);

    for i = 1, #self.itens do
        if(self.itens[i] == elem) then
            table.remove(self.itens, i);
            break;
        end
    end

    if(#self.itens < tamanho_anterior and #self.itens == 0) then
        self.raiz = 0;
        self.profundidade = 0;
    end
end

function Arvore:print()
    if(self.raiz == 0) then
        error("Arvore vazia");
    end
    self.raiz:print();
end

return Arvore;
