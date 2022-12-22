function binary_search (array, value)
    local first = 1
    local last = #array
    while first <= last do
        local mid = math.floor((first + last) / 2)
        if array[mid] < value then
            first = mid + 1
        elseif value < array[mid] then
            last = mid - 1
        else
            return mid
        end
    end
    return nil
end
