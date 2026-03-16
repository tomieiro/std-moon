local M = {}

-- Calcula, pelo algoritmo de Djikistra, o caminho mais curto entre de e para
-- @param matriz: lista de adjacência
-- @param de: vertice de origem
-- @param para: vertice de destino
-- @return: distancia mais curta e lista de vertices que formam o caminho mais curto
function M.djikstra(matriz, de, para)
    if type(matriz) ~= "table" then
        error("Matriz invalida para busca do menor caminho.")
    end
    if type(de) ~= "number" or type(para) ~= "number" then
        error("Vertices invalidos para busca do menor caminho.")
    end
    if de < 1 or de > #matriz or para < 1 or para > #matriz then
        error("Vertices invalidos para busca do menor caminho.")
    end

    local dist = {}
    local prev = {}
    local Q = {}
    local u
    local alt

    for v = 1, #matriz do
        dist[v] = math.huge
        prev[v] = nil
        Q[v] = v
    end

    dist[de] = 0

    while #Q > 0 do
        u = M.extractMin(Q, dist)
        if u == nil then
            break
        end
        if type(matriz[u]) ~= "table" then
            error("Linha invalida na matriz de adjacencia.")
        end
        if u == para then
            break
        end

        for v = 1, #matriz[u] do
            if type(matriz[u][v]) ~= "number" then
                error("Peso invalido na matriz de adjacencia.")
            end
            if matriz[u][v] ~= 0 then
                alt = dist[u] + matriz[u][v]
                if alt < dist[v] then
                    dist[v] = alt
                    prev[v] = u
                end
            end
        end
    end

    return dist[para], prev
end

function M.extractMin(Q, dist)
    if type(Q) ~= "table" or type(dist) ~= "table" then
        error("Estruturas invalidas para extracao do minimo.")
    end
    local min = math.huge
    local minIndex = 0
    for i = 1, #Q do
        if dist[Q[i]] < min then
            min = dist[Q[i]]
            minIndex = i
        end
    end
    if minIndex == 0 then
        return nil
    end
    local u = Q[minIndex]
    table.remove(Q, minIndex)
    return u
end

return M
 
