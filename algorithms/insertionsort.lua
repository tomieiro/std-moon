return function(table)
    if type(table) ~= 'table' then
        error('Argumento invalido para ordenacao.')
    end
    local length = #table
    for j = 2, length, 1 do
        local value = table[j]
        local i = j - 1
        if type(value) ~= 'number' then
            error('Valor invalido para ordenacao.')
        end
        while i > 0 do
            if type(table[i]) ~= 'number' then
                error('Valor invalido para ordenacao.')
            end
            if table[i] <= value then
                break
            end
            table[i + 1] = table[i]
            i = i - 1
        end
        table[i + 1] = value
    end
    return table
end
