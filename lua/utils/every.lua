local function every(test)
  return function(list)
    for key, value in pairs(list) do
      if test(value, key) ~= true then
        return false
      end
    end

    return true
  end
end

return every
