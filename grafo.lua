--Definicao padrao dos atributos do Grafo
Grafo = {nos = {}, tamanho = 0};


--Metodo construtor que instancia o objeto Grafo.
--args: (Table) Atributos desejados para a Grafo.
--return: (Object) Grafo instanciado.
function Grafo:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    return atributos;
end

