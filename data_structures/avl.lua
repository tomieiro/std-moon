local No = {no_dir = nil, no_esq = nil, valor = 0, height = 1};

function No:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    return atributos;
end

function No:getHeight(node)
    if(type(node) ~= "table") then
        return 0;
    end

    return node.height
end

function No:getBalance(node)
    if(type(node) ~= "table") then
        return 0;
    end

    return No:getHeight(node.no_esq) - No:getHeight(node.no_dir)
end

function No:leftRotate(node)
    local ramo_dir;
    local ramo_esq;

    if(type(node.no_dir) == "table") then
        ramo_dir = node.no_dir
    end

    if(type(ramo_dir) == "table") then
        ramo_esq = ramo_dir.no_esq
        ramo_dir.no_esq = node
    end
   
    node.no_dir = ramo_esq

    node.height = math.max(No:getHeight(node.no_esq), No:getHeight(node.no_dir)) + 1
    if(type(ramo_dir) == "table") then
        ramo_dir.height = math.max(No:getHeight(ramo_dir.no_esq),No:getHeight(ramo_dir.no_dir)) + 1
    end

    return ramo_dir
end

function No:rightRotate(node)
    local ramo_esq 
    local ramo_dir

    if(type(node.no_esq) == "table") then
        ramo_esq = node.no_esq
    end

    if(type(ramo_esq) == "table") then
        ramo_dir = ramo_esq.no_dir
        ramo_esq.no_dir = node
    end

    node.no_esq = ramo_dir

    node.height =  math.max(No:getHeight(node.no_esq), No:getHeight(node.no_dir)) + 1
    if( type(ramo_esq) == "table") then
        ramo_esq.height = math.max(No:getHeight(ramo_esq.no_esq),No:getHeight(ramo_esq.no_dir)) + 1
    end

    return ramo_esq
end

function No:insereNo(new_value)
   
    if( (type(self.no_dir) ~= "table") and (new_value >= self.valor)) then
        self.no_dir = No:new({valor = new_value});
        self.height = math.max(No:getHeight(self.no_dir), No:getHeight(self.no_esq)) + 1
        return self;
    end
    if( (type(self.no_esq) ~= "table") and (new_value < self.valor)) then
        self.no_esq = No:new({valor = new_value});
        self.height = math.max(No:getHeight(self.no_dir), No:getHeight(self.no_esq)) + 1
        return self;
    end

    if(new_value >= self.valor) then
        self.no_dir = self.no_dir:insereNo(new_value);
    else
        self.no_esq = self.no_esq:insereNo(new_value);
    end

    self.height = math.max(No:getHeight(self.no_dir), No:getHeight(self.no_esq)) + 1

    local balance = No:getBalance(self)

    if(type(self.no_esq) == "table") then
        if (balance > 1 and new_value < self.no_esq.valor) then
            return No:rightRotate(self)
        end

        if (balance > 1 and new_value >= self.no_esq.valor) then 
            self.no_esq = No:leftRotate(self.no_esq)
            return No:rightRotate(self)
        end

    end

    if(type(self.no_dir) ==  "table") then
        if(balance < -1 and new_value >= self.no_dir.valor) then
            return No:leftRotate(self)
        end

        if (balance < -1 and new_value < self.no_dir.valor) then
            self.no_dir = No:rightRotate(self.no_dir)
            return No:leftRotate(self)
        end
    end

    return self
end

function No:getMinValueNode(node)
    local atual = node
    while type(atual.no_esq) == "table" do
        atual = atual.no_esq
    end
    return atual
end

function No:print()
    if(type(self.no_esq) =="table") then
      self.no_esq:print();
    end

    io.write(string.format("valor:%s height:%s\n", self.valor, self.height));

    if(type(self.no_dir) == "table") then
      self.no_dir:print();
    end
    return "";
end

function No:removeNo(value)
    if(type(self) ~= "table") then
        return self
    end
    
    if(value < self.valor) then
        if(type(self.no_esq) == "table") then
            self.no_esq = self.no_esq:removeNo(value)
        end
    elseif(value > self.valor) then
        if(type(self.no_dir) == "table") then
            self.no_dir = self.no_dir:removeNo(value)
        end
    else
        if(type(self.no_esq) ~= "table" and type(self.no_dir) ~= "table") then
            return nil
        end

        if(type(self.no_esq) ~= "table") then
            return self.no_dir
        end

        if(type(self.no_dir) ~= "table") then
            return self.no_esq
        end

        local temp = No:getMinValueNode(self.no_dir)
        self.valor = temp.valor
        self.no_dir = self.no_dir:removeNo(temp.valor)
    end

    self.height = math.max(No:getHeight(self.no_dir), No:getHeight(self.no_esq)) + 1

    local balance = No:getBalance(self)

    if(balance > 1 and No:getBalance(self.no_esq) >= 0) then
        return No:rightRotate(self)
    end

    if(balance > 1 and No:getBalance(self.no_esq) < 0) then
        self.no_esq = No:leftRotate(self.no_esq)
        return No:rightRotate(self)
    end

    if(balance < -1 and No:getBalance(self.no_dir) <= 0) then
        return No:leftRotate(self)
    end

    if(balance < -1 and No:getBalance(self.no_dir) > 0) then
        self.no_dir = No:rightRotate(self.no_dir)
        return No:leftRotate(self)
    end

    return self
end

Arvore = {raiz = nil, profundidade = 0}

function Arvore:new(atributos)
    atributos = atributos or {};
    self.__index = self;
    atributos.raiz = atributos.raiz or nil;
    atributos.profundidade = atributos.profundidade or 0;
    setmetatable(atributos, self);
    return atributos;
end

function Arvore:add(new_value)
    if(type(new_value) ~= "number" and type(new_value) ~= "string") then
        error("\27[33mErro: Tipo do dado não suportado!\27[0m")
    end

    if (type(self.raiz) ~= "table") then 
      self.raiz = No:new({ valor = new_value })
      return
    end

    self.raiz = self.raiz:insereNo(new_value);
    
end

function Arvore:print(no_atual)
    if(type(self.raiz) ~= "table") then error("\27[33mErro: Arvore vazia!\27[0m") end
    if(type(no_atual) == "nil") then
      no_atual = self.raiz;
    end
    no_atual:print();
  end

return Arvore;
