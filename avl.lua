
Tree = {}


function Tree:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self)
    self._index = self;
    return atributos
end

function Tree:newNode(new_value)
    return setmetatable({
        value = new_value,
        height = 0
    }, Tree)
end


function Tree:getHeight(node)
    return node.height
end

function Tree:setHeight(node)
    node.height = math.max(Tree:getHeight(node.right), Tree:getHeight(node.right)) + 1
end

function Tree:getBalance(node)
    return Tree:getHeight(node.right) - Tree:getHeight(node.left)
end

function Tree:rotateNode(sub_raiz, rot_side, oppo_side)
    local pivo = sub_raiz[oppo_side]
    sub_raiz[oppo_side] =  pivo[rot_side]
    pivo[rot_side] = sub_raiz
    sub_raiz, pivo = pivo, sub_raiz
    Tree:setHeight(pivo)
    Tree:setHeight(sub_raiz)
    return sub_raiz
end

function Tree:updateSubtree(sub_raiz)
    Tree:setHeight(sub_raiz)
    local rot_side, oppo_side, pivo, rotate_pivo
    local balance = getBalance(sub_raiz)
    if balance > 1 then
        pivo = sub_raiz.right
        if Tree:getBalance(pivo) < 0 then rotate_pivo = true end
        rot_side, oppo_side = 'left', 'right'
    elseif balance < -1 then
        pivo = sub_raiz.left 
        if Tree:getBalance(pivo) > 0  then rotate_pivo = true end
        rot_side, oppo_side = 'right', 'left'
    end
    if rot_side then
        if rotate_pivo then
            sub_raiz[oppo_side] = Tree:rotateNode(pivo, oppo_side, rot_side)
        end
        sub_raiz = Tree:rotateNode(sub_raiz, rot_side, oppo_side)
    end
    return sub_raiz
end

function Tree:add(self, new_value)
   
    if not self or not self.value then
        self = newNode(new_value)
    else
        if new_value < self.value then
            self.left = Tree:add(self.left,new_value)
        elseif new_value > self.value then
            self.right = Tree:add(self.right, new_value)
        else new_value = nil end
        Tree:updateSubtree(self)
    end
end

function Tree:remove(self, value)
    local v = self.value
    if v == value then
        if not self.left or self.right then
            return self.left or self.right
        else
            local sNode = self.right
            while sNode.left do
                sNode = sNode.left
            end
            self = Tree:remove(self, sNode.value)
            self.value = sNode.value
            return self
        end
    else 
        if value < v then
            self.left = Tree:remove(self.left, value)
        else
            self.right = Tree:remove(self.right, value)
        end
    end
    return updateSubtree(self)
end

function Tree:printTree(self)
    if self then
        Tree:printTree(self.left)
        print(self.value)
        Tree:printTree(self.right)
    end
end


function Tree:free()
    
end