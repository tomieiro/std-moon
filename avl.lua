
Tree = {raiz = {}, numero_nos = 0}

-- Método que instancia o objeto Tree
-- args: () 

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
    node.height = math.max(getHeight(node.right), getHeight(node.right)) 
end

function Tree:getBalance(node)
    return getHeight(node.right) - getHeight(node.left)
end

function Tree:leftRotate()

end


function Tree:rightRotate()

end


function Tree:add(new_value)
   
    local No 

    if not No or not No.value then
        No = newNode(new_value)
    else
        if new_value < No.value then
            No.left = add(No.left,new_value)
        elseif new_value > No.value then
            self.right = add(No.right, new_value)
    end

  

    if self.numero_nos == 0 then
        self.raiz = No
    else

    end

    self.numero_nos = self.numero_nos + 1
end

function Tree:remove()

end

function Tree:free()
    
end