--Classe Interna No
local No = {NoEsq = nil, NoDir = nil, valor = nil}

--Metodo construtor que instancia o objeto No.
--args: (Table) Atributos desejados para a arvore.
--return: (Object) No instanciada.
function No:new(atributos)
  atributos = atributos or {};
  setmetatable(atributos, self);
  self.__index = self;
  return atributos;
end

function No:insert_filho(no_filho)
  if(type(self.NoDir) ~= "table" and (no_filho >= self.valor)) then
    self.NoDir = No:new({valor = no_filho})
    return
  end
  if(type(self.NoEsq) ~= "table" and (no_filho < self.valor)) then
    self.NoEsq = No:new({valor = no_filho})
    return
  end
  if(no_filho >= self.valor) then
    self.NoDir:insert_filho(no_filho);
  else
    self.NoEsq:insert_filho(no_filho);
  end
end

function No:remove_filho(no_filho, no_pai, direcao)
  if no_filho == self.valor then
    if(type(self.NoDir) ~= "table" and type(self.NoEsq) ~= "table") then
      local aux = {__mode = "kv"}
      setmetatable(self, aux);
      self.valor = nil;
      self = nil;
      no_pai[direcao] = nil;
    elseif(type(self.NoEsq) ~= "table" or type(self.NoDir) ~= "table") then
      no_pai[direcao] = (self.NoEsq or self.NoDir);
      local aux = {__mode = "kv"}
      setmetatable(self, aux);
      self.valor = nil;
      self = nil;
    else
      --[[if (self.NoEsq.NoEsq or self.NoEsq.NoDir) then
      
      elseif (self.NoDir.NoEsq or self.NoDir.NoDir) then
      
      else

      end--]]
    end
  else
    if(no_filho >= self.valor) then
      self.NoDir:remove_filho(no_filho, self, "NoDir");
    else
      self.NoEsq:remove_filho(no_filho, self, "NoDir");
    end
  end
end
--Percorre em ordem(infixa)
function No:print()
  if(type(self.NoEsq) =="table") then
    io.write(self.NoEsq:print());
  end
  io.write(string.format("%s ", self.valor));
  if(type(self.NoDir) == "table") then
    io.write(self.NoDir:print());
  end
  
end

--Classe Arvore
Arvore = {profundidade = nil, raiz = nil};

--Metodo construtor que instancia o objeto Arvore Binaria.
--args: (Table) Atributos desejados para a arvore.
--return: (Object) Lista instanciada.
function Arvore:new(atributos)
  atributos = atributos or {};
  setmetatable(atributos, self);
  self.__index = self;
  return atributos;
end

function Arvore:insert(no_aux)
  if(type(no_aux) ~= "number" and type(no_aux) ~= "string") then
    error("\27[33mErro: Tipo do dado não suportado!\27[0m")
  end
  if(type(Arvore.raiz) ~= "table") then
    Arvore.raiz = No:new({valor = no_aux});
    self.profundidade = 1;
    return;
  end
  self.raiz:insert_filho(no_aux);
end

function Arvore:remove(no_aux)
  if(type(no_aux) ~= "number" and type(no_aux) ~= "string") then
    error("\27[33mErro: Tipo do dado não suportado!\27[0m")
  end
  self.raiz:remove_filho(no_aux, nil);
  collectgarbage();
end

function Arvore:print(no_atual)
  if(self.raiz == 0) then error("\27[33mErro: Arvore vazia!\27[0m") end
  if(type(no_atual) == "nil") then
    no_atual = self.raiz;
  end
  print(no_atual:print());
end

return Arvore;
