local table = require "table"

local M = {}

-- Método de ordenação por intercalação (merge sort)
-- args: (Lista) Lista a ser ordenado
-- return: (Lista) Lista ordenado
function M.mergeSort(vetor)
    if type(vetor) ~= "table" then
        error("Argumento invalido para ordenacao.");
    end
    if #vetor <= 1 then
        return vetor;
    end
    local tamanho_vetor = #vetor;
    local meio = math.floor(tamanho_vetor/2);
    local vetor_esquerdo = {table.unpack(vetor, 1, meio)};
    local vetor_direito = {table.unpack(vetor, meio+1, tamanho_vetor)};

    local esquerda = M.mergeSort(vetor_esquerdo);
    local direita = M.mergeSort(vetor_direito);
    local result = merge(esquerda, direita);
    return result;
end

-- Subrotina para intercalar dois vetores já ordenados
-- arg: (Lista) Lista esquerdo
-- arg: (Lista) Lista direito
-- return: (Lista) Lista resultante da intercalação
function merge(esquerda, direita)
    local result = {}
    local i = 1;
    local j = 1;
    while i <= #esquerda and j <= #direita do
        if esquerda[i] < direita[j] then
            result[#result + 1] = esquerda[i];
            i = i + 1;
        else
            result[#result + 1] = direita[j];
            j = j + 1;
        end
    end

    while i <= #esquerda do
        result[#result + 1] = esquerda[i];
        i = i + 1;
    end

    while j <= #direita do
        result[#result + 1] = direita[j];
        j = j + 1;
    end

    return result;
end

return M
