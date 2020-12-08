
local No = {no_dir = nil, no_esq = nil, valor = 0, height = 0};

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

function No:setHeight(node)

    if(type(node) ~= "table") then
        return 1
    end
    node.height = math.max(No:getHeight(node.right), No:getHeight(node.right)) + 1
end

-- function No:getBalance(node)
--     return Arvore:getHeight(node.right) - Arvore:getHeight(node.left)
-- end


function No:insereNo(new_value)
    if( (type(self.no_dir) ~= "table") and (new_value >= self.valor)) then
        self.no_dir = No:new({valor = new_value});
        No:setHeight(self.no_dir)
        return;
    end
    if( (type(self.no_esq) ~= "table") and (new_value < self.valor)) then
        self.no_esq = No:new({valor = new_value});
        No:setHeight(self.no_esq)
        return;
    end

    if(new_value >= self.valor) then
        self.no_dir:insereNo(new_value);
    else
        self.no_esq:insereNo(new_value);
    end
end




Arvore = {raiz = nil, profundidade = 0}

function Arvore:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    return atributos;
end

-- function Arvore:rotateNode(sub_raiz, rot_side, oppo_side)
--     local pivo = sub_raiz[oppo_side]
--     sub_raiz[oppo_side] =  pivo[rot_side]
--     pivo[rot_side] = sub_raiz
--     sub_raiz, pivo = pivo, sub_raiz
--     Arvore:setHeight(pivo)
--     Arvore:setHeight(sub_raiz)
--     return sub_raiz
-- end

function Arvore:updateSubArvore(sub_raiz)
    Arvore:setHeight(sub_raiz)
    local rot_side, oppo_side, pivo, rotate_pivo
    local balance = getBalance(sub_raiz)
    if balance > 1 then
        pivo = sub_raiz.right
        if Arvore:getBalance(pivo) < 0 then rotate_pivo = true end
        rot_side, oppo_side = 'left', 'right'
    elseif balance < -1 then
        pivo = sub_raiz.left 
        if Arvore:getBalance(pivo) > 0  then rotate_pivo = true end
        rot_side, oppo_side = 'right', 'left'
    end
    if rot_side then
        if rotate_pivo then
            sub_raiz[oppo_side] = Arvore:rotateNode(pivo, oppo_side, rot_side)
        end
        sub_raiz = Arvore:rotateNode(sub_raiz, rot_side, oppo_side)
    end
    return sub_raiz
end

function Arvore:add(new_value)
    if(type(new_value) ~= "number" and type(new_value) ~= "string") then
        error("\27[33mErro: Tipo do dado não suportado!\27[0m")
    end

    if (type(self.raiz) ~= "table") then 
      self.raiz = No:new({ valor = new_value })
      No:setHeight(self.raiz)
      return
    end

    self.raiz:insereNo(new_value);

    --Arvore:updateSubArvore(self)
end

-- function Arvore:remove(value)
--     local v = self.value
--     if v == value then
--         if not self.left or self.right then
--             return self.left or self.right
--         else
--             local sNode = self.right
--             while sNode.left do
--                 sNode = sNode.left
--             end
--             self = Arvore:remove(self, sNode.value)
--             self.value = sNode.value
--             return self
--         end
--     else 
--         if value < v then
--             self.left = Arvore:remove(self.left, value)
--         else
--             self.right = Arvore:remove(self.right, value)
--         end
--     end
--     return updateSubArvore(self)
-- end

function No:print()
    if(type(self.no_esq) =="table") then
      io.write(self.no_esq:print());
    end

    io.write(string.format("valor:%s height:%s\n", self.valor, self.height));

    if(type(self.no_dir) == "table") then
      io.write(self.no_dir:print());
    end

  end

function Arvore:print(no_atual)
    if(self.raiz == 0) then error("\27[33mErro: Arvore vazia!\27[0m") end
    if(type(no_atual) == "nil") then
      no_atual = self.raiz;
    end
    print(no_atual:print());
  end

return Arvore;