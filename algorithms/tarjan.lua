 
local M = {}

-- Calcula, pelo algoritmo de Tarjan, as componentes fortemente conexas
-- @param grafo: Grafo ou lista de adjacência
-- @return: lista com as componentes encontradas
function M.tarjan(grafo)
    if type(grafo) ~= "table" then
        error("Grafo invalido para busca de componentes.")
    end

    local index = 0
    local stack = {}
    local stack_size = 0
    local indices = {}
    local lowlink = {}
    local onstack = {}
    local componentes = {}
    local vertices = {}

    if type(grafo.nos) == "table" then
        for v, _ in pairs(grafo.nos) do
            vertices[#vertices + 1] = v
        end
    else
        for v = 1, #grafo do
            vertices[#vertices + 1] = v
        end
    end

    local function strongconnect(v)
        local adjacentes = {}

        if type(grafo.nos) == "table" then
            if type(grafo.nos[v]) ~= "table" then
                error("No invalido no grafo.")
            end
            for w, _ in pairs(grafo.nos[v].adj) do
                adjacentes[#adjacentes + 1] = w
            end
        else
            if type(grafo[v]) ~= "table" then
                error("Lista de adjacencia invalida para o vertice.")
            end
            for i = 1, #(grafo[v] or {}) do
                adjacentes[#adjacentes + 1] = grafo[v][i]
            end
        end

        index = index + 1
        indices[v] = index
        lowlink[v] = index
        stack_size = stack_size + 1
        stack[stack_size] = v
        onstack[v] = true

        for i = 1, #adjacentes do
            local w = adjacentes[i]
            if type(grafo.nos) == "table" and type(grafo.nos[w]) ~= "table" then
                error("Vertice invalido na lista de adjacencia.")
            end
            if type(grafo.nos) ~= "table" and (type(w) ~= "number" or w < 1 or w > #grafo) then
                error("Vertice invalido na lista de adjacencia.")
            end
            if indices[w] == nil then
                strongconnect(w)
                if lowlink[w] < lowlink[v] then
                    lowlink[v] = lowlink[w]
                end
            elseif onstack[w] and indices[w] < lowlink[v] then
                lowlink[v] = indices[w]
            end
        end

        if lowlink[v] == indices[v] then
            local componente = {}
            while stack_size > 0 do
                local w = stack[stack_size]
                stack[stack_size] = nil
                stack_size = stack_size - 1
                onstack[w] = false
                componente[#componente + 1] = w
                if w == v then
                    break
                end
            end
            componentes[#componentes + 1] = componente
        end
    end

    for i = 1, #vertices do
        local v = vertices[i]
        if indices[v] == nil then
            strongconnect(v)
        end
    end

    return componentes
end

return M
