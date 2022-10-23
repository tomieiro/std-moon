return function(table)
    if #table <= 1 then
        return table
    else
        local len = #table
        local left = {}
        local right = {}
        local newtable = {}
        local pivot = table[len]
        table[len] = nil
        for i = 1, len, 1 do
            local x = table[i]
            if type(x) ~= 'number' then
                break
            end
            if x <= pivot then
                left[#left + 1] = x
            elseif x > pivot then
                right[#right + 1] = x
            end
        end
        for _, t in pairs({algorithms.sort.quick(left), {pivot}, algorithms.sort.quick(right)}) do
            for _, v in pairs(t) do
                newtable[#newtable + 1] = v
            end
        end
        return newtable
    end
end