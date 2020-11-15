--Definicao padrao dos atributos da Fila
Matriz = {m = {{}}, rows = 0,cols = 0};

--Metodo cosntrutor que instancia o objeto Matriz.
--args: (Table) Atributos desejados para a Matriz.
--return: (Object) Matriz instanciada.
function Matriz:new(atributos, rows, cols)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
    self.rows = rows;
    self.cols = cols;
    return atributos;
end

--Metodo que retorna uma linha da Matriz
--args: Linha desejada da Matriz
--return: (Object) Linha da Matriz requisitada
function Matriz:getLine(line)
    return self.m[line];
end

--Metodo que retorna uma Coluna da Matriz
--args: Coluna desejada da Matriz
--return: (Object) Coluna da Matriz requisitada
function Matriz:getCol(col)
    
    local col_obj = {};
    
    for i = 0, self.rows do
        
        col_obj[i] = self.m[i][col];

    end

    return col_obj;
end

--Metodo que troca um item da Matriz por outro
--args: Linha do primeiro item, coluna do primeiro item, linha do segundo item, coluna do segundo
function Matriz:swap(first_row, first_col, second_row, second_col)
    
    aux = self.m[first_row][first_col];
    self.m[first_row][first_col] = self.m[second_row][second_col];
    self.m[second_row][second_col] = aux;

    return
end

--Metodo retorna um item da Matriz 
--args: Linha do item, coluna do item
--return: (Object) item da Matriz da posicao requisitada
function Matriz:getPos(row, col)

    return self.m[rom][col];
end

--Metodo retorna um item da Matriz 
--args: Linha do item, coluna do item
--return: (Object) item da Matriz da posicao requisitada
function Matriz:getPos(row, col)

    return self.m[rom][col];
end

--Metodo Adiciiona um item na Matriz 
--args: Linha do item, coluna do item
function Matriz:setPos(item, row, col)

    self.m[rom][col] = item;

    return
end

--Metodo para liberar a Matriz
function Matriz:free()
    for i= 0, self.rows do
        for j=0,self.cols do
            
            self.m[i][j] = nil;

        end
    end
    local aux = {__mode = "k"}
    setmetatable(self.m,aux);
    setmetatable(self, aux);
    self = nil;
    collectgarbage();
end


return Fila;