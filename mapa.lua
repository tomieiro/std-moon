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
--args: (Object) Objeto desejados para incluir na Fila.
function Fila:push(chave, objeto)
    aux = {chave, objeto}
    self.size = self.size +1; 
    table.insert(self.itens,self.size,aux);
    return;
end

--Metodo para liberar o Mapa
function Mapa:free()
    for i= 1, self.size do
        self.itens[i] = nil;
    end
    local aux = {__mode = "k"}
    setmetatable(self.itens,aux);
    setmetatable(self, aux);
    self = nil;
    collectgarbage();
end


return Mapa;