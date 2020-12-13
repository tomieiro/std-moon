--Definicao padrao dos atributos da Mapa
Mapa = {itens = {}, size = 0};

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

    if ((type(self.itens[chave]) ~= "nil" )or (chave == "nil")) then
        error("\27[33mErro: Chave invalida ou em uso!\27[0m");
    end
    
    self.size = self.size +1; 
    self.itens[chave] = objeto;
    return;
end

function mapa:removeByValue(objeto,decisao)
    for k,v in pairs(self.itens) do
        if(v == objeto) then
            self.itens[k] = nil
            if(decisao == "primeiro") then return end
        end
    end
    --issue 16
end

--Metodo que remove um objeto da primeira posição
--return: (Object) Objeto removido do mapa
function Mapa:remove(chave)
    if (self.size < 1) then
        error("\27[33mErro: Estrutura vazia!\27[0m");
    end

    self.size = self.size -1;
    self.itens[chave] = nil;
    --issue 16
    return;
end

--Metodo get que retorna o primeiro objeto com a chave desejada.
--args: (Object) chave que esta sendo buscada.
--return: (Object) Objeto encontrado que possui a chave desejada.
function Mapa:getByKey(chave)
    if (type(self.itens[chave]) == nil or chave == nil) then
        error("\27[33mErro: Chave invalida ou em uso!\27[0m");
    end

    return self.itens[chave];
end

--Metodo set que procura e altera o primeiro objeto com a chave desejada
--args: (Object) chave que esta sendo  buscada;novo objeto que vai substituir o antigo.
function Mapa:setByKey(chave,novo_objeto)
    if (type(self.itens[chave]) == nil or chave == nil) then
        error("\27[33mErro: Chave invalida!\27[0m");
    end
    self.remove(chave);
    self.push(chave, novo_objeto);
    
end

function Mapa:print()
    for k,v in pairs(self.itens) do
        
        print(k,v);
    end
end

--Metodo para liberar o Mapa
function Mapa:free()
    for k,_ in pairs(self.itens) do
        self.itens[k] = nil;
    end
    local aux = {__mode = "k"}
    setmetatable(self.itens,aux);
    setmetatable(self, aux);
    self = nil;
    collectgarbage();
end

return Mapa;