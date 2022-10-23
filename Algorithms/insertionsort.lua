return function(table)
    local length = #table
    for j = 2, length, 1 do
        local value = table[j]
        local i = j - 1
        if type(value) ~= 'number' or i <= 0 then
            break
        end
        while i > 0 and table[i] > value do
            table[i + 1] = table[i]
            i = i - 1
        end
        table[i + 1] = value
    end
    return table
end