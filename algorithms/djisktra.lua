local M = {}

-- Calcula, pelo algoritmo de Djikistra, o caminho mais curto entre de e para
-- @param matriz: lista de adjacência
-- @param de: vertice de origem
-- @param para: vertice de destino
-- @return: distancia mais curta e lista de vertices que formam o caminho mais curto
function M.djikstra(matriz, de, para)
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
        if u == para then
            break
        end

        for v = 1, #matriz[u] do
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
    local min = math.huge
    local minIndex = 0
    for i = 1, #Q do
        if dist[Q[i]] < min then
            min = dist[Q[i]]
            minIndex = i
        end
    end
    local u = Q[minIndex]
    table.remove(Q, minIndex)
    return u
end

return M
 
