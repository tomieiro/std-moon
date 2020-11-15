--Definicao padrao dos atributos da Fila
Matriz = {m = {{}}, rows = 0,cols = 0, row_pos = 0, col_pos = 0};

--Metodo cosntrutor que instancia o objeto Matriz.
--args: (Table) Atributos desejados para a Matriz.
--return: (Object) Matriz instanciada.
function Matriz:new(atributos)
    atributos = atributos or {};
    setmetatable(atributos, self);
    self.__index = self;
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