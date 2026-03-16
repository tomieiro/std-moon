local No = {NoEsq = 0, NoDir = 0, valor = 0}

function No:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    return atributos;
end

function No:insert_filho(no_filho)

end


Arvore = {itens = {}, profundidade = 0, raiz = 0;

--Metodo construtor que instancia o objeto Arvore Binaria.
--args: (Table) Atributos desejados para a arvore.
--return: (Object) Lista instanciada.
function Arvore:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    return atributos;
end

function Arvore:insert(elem)
  if(self.raiz == 0) then
    self.raiz = cria_no(elem);
  else
    local aux = busca_no();
    aux.insert_filho();
  end
end

return Arvore;
