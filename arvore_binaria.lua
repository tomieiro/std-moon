Lista = {itens = {}, profundidade = 0, raiz = {}};

--Metodo construtor que instancia o objeto Arvore Binaria.
--args: (Table) Atributos desejados para a arvore.
--return: (Object) Lista instanciada.
function Lista:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    return atributos;
end
