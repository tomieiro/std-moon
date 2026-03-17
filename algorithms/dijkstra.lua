local M = {}

-- Calcula, pelo algoritmo de Dijkstra, o caminho mais curto entre de e para
-- @param grafo: Grafo ou matriz de adjacência
-- @param de: vertice de origem
-- @param para: vertice de destino
-- @return: distancia mais curta e lista de vertices que formam o caminho mais curto
function M.dijkstra(grafo, de, para)
    if type(grafo) ~= "table" then
        error("Grafo invalido para busca do menor caminho.")
    end

    local dist = {}
    local prev = {}
    local Q = {}
    local u
    local alt

    if type(grafo.nos) == "table" then
        if grafo.nos[de] == nil or grafo.nos[para] == nil then
            error("Vertices invalidos para busca do menor caminho.")
        end

        for v, _ in pairs(grafo.nos) do
            dist[v] = math.huge
            prev[v] = nil
            Q[#Q + 1] = v
        end
    else
        if de < 1 or de > #grafo or para < 1 or para > #grafo then
            error("Vertices invalidos para busca do menor caminho.")
        end

        for v = 1, #grafo do
            dist[v] = math.huge
            prev[v] = nil
            Q[#Q + 1] = v
        end
    end

    dist[de] = 0

    while #Q > 0 do
        u = M.extractMin(Q, dist)
        if u == nil then
            break
        end
        if u == para then
            break
        end

        if type(grafo.nos) == "table" then
            if type(grafo.nos[u]) ~= "table" then
                error("No invalido no grafo.")
            end
            for v, peso in pairs(grafo.nos[u].adj) do
                if type(grafo.nos[v]) ~= "table" then
                    error("Vertice invalido no grafo.")
                end
                if type(peso) ~= "number" then
                    error("Peso invalido no grafo.")
                end
                alt = dist[u] + peso
                if alt < dist[v] then
                    dist[v] = alt
                    prev[v] = u
                end
            end
        else
            if type(grafo[u]) ~= "table" then
                error("Linha invalida na matriz de adjacencia.")
            end

            for v = 1, #grafo[u] do
                if type(grafo[u][v]) ~= "number" then
                    error("Peso invalido na matriz de adjacencia.")
                end
                if grafo[u][v] ~= 0 then
                    alt = dist[u] + grafo[u][v]
                    if alt < dist[v] then
                        dist[v] = alt
                        prev[v] = u
                    end
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
