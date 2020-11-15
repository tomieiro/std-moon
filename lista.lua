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


return Lista;