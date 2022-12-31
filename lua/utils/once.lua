return function(callback)
  return function(list)
    for key, value in pairs(result) do
      if callback(value, key) then
        return true
      end
    end

    return false
  end
end
