local q; q = function(table)
    if type(table) ~= 'table' then
        error('Argumento invalido para ordenacao.')
    end
    if #table <= 1 then
        return table
    else
        local len = #table
        local left = {}
        local right = {}
        local newtable = {}
        local pivot = table[len]
        if type(pivot) ~= 'number' then
            error('Valor invalido para ordenacao.')
        end
        for i = 1, len - 1, 1 do
            local x = table[i]
            if type(x) ~= 'number' then
                error('Valor invalido para ordenacao.')
            end
            if x <= pivot then
                left[#left + 1] = x
            elseif x > pivot then
                right[#right + 1] = x
            end
        end
        for _, t in pairs({q(left), {pivot}, q(right)}) do
            for _, v in pairs(t) do
                newtable[#newtable + 1] = v
            end
        end
        return newtable
    end
end

return q
