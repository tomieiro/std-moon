--Definicao padrao dos atributos do Grafo
Grafo = {nos = {}, tamanho = 0};
--no = {adj = {}}
--adj = {} --cada entrada contém um peso


--Metodo cosntrutor que instancia o objeto Grafo.
--args: (Table) Atributos desejados para a Grafo.
--return: (Object) Grafo instanciado.
function Grafo:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    return atributos;
end

function Grafo:addNo(index, valor)
    if(index == nil) then
        error("\27[33mErro: index não pode ser vazio\27[0m")
    end
    if (self.nos[index] ~= nil) then
        error("\27[33mErro: um nó com esse index já existe\27[0m")
    end

    self.tamanho = self.tamanho + 1
    self.nos[index] = {adj = {}, valor = valor}

end

function Grafo:removeNo(index)
    if(index == nil) then
        error("\27[33mErro: index não pode ser vazio\27[0m")
    end
    if (self.nos[index] == nil) then
        --error("\27[33mErro: um nó com esse index não existe\27[0m")
        return
    end

    self.tamanho = self.tamanho - 1
    self.nos[index] = nil
    for k, v in pairs(self.nos) do
        self.nos[k].adj[index] = nil
    end
end

function Grafo:addEdge(src, dest, peso)
    if((src == nil) or (dest == nil)) then
        error("\27[33mErro: src e dest não podem ser vazios\27[0m")
    end

    if ((self.nos[src] == nil) or (self.nos[dest] == nil)) then
        error("\27[33mErro: src e dest devem ser índices de nós existentes\27[0m")
    end

    self.nos[src].adj[dest] = peso or 1
end

function Grafo:removeEdge(src, dest)
    if((src == nil) or (dest == nil)) then
        error("\27[33mErro: src e dest não podem ser vazios\27[0m")
    end

    if ((self.nos[src] == nil) or (self.nos[dest] == nil)) then
        error("\27[33mErro: src e dest devem ser índices de nós existentes\27[0m")
    end

    self.nos[src].adj[dest] = nil
end

function Grafo:printAdjacent(index)
    if(index == nil) then
        error("\27[33mErro: index não pode ser vazio\27[0m")
    end
    if (self.nos[index] == nil) then
        print(index .. ": inexistente")
        return
    end

    print("[" .. index .. "]")
    for k, v in pairs(self.nos[index].adj) do
        print("\t" .. k .. " (" .. v .. ")")
    end
end

function Grafo:print()
    if(self.tamanho == 0) then
        print("Grafo vazio")
        return
    end

    for k, v in pairs(self.nos) do
        self:printAdjacent(k)
    end
end

function Grafo:getValor(index)
    if(index == nil) then
        error("\27[33mErro: index não pode ser vazio\27[0m")
    end

    return self.nos[index].valor
end

return Grafo