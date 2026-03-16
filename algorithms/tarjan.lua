 
local M = {}

-- Calcula, pelo algoritmo de Tarjan, as componentes fortemente conexas
-- @param grafo: lista de adjacência
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

    local function strongconnect(v)
        if type(grafo[v]) ~= "table" then
            error("Lista de adjacencia invalida para o vertice.")
        end
        index = index + 1
        indices[v] = index
        lowlink[v] = index
        stack_size = stack_size + 1
        stack[stack_size] = v
        onstack[v] = true

        for i = 1, #(grafo[v] or {}) do
            local w = grafo[v][i]
            if type(w) ~= "number" or w < 1 or w > #grafo then
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

    for v = 1, #grafo do
        if indices[v] == nil then
            strongconnect(v)
        end
    end

    return componentes
end

return M
