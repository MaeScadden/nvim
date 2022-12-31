return function(callback)
  return function(input)
    local list = {}

    for key, value in pairs(input) do
      if callback(value, key) then
        list[key] = value
      end
    end

    return list
  end
end
