return function(str, sub)
  local index = string.find(str, sub, 1, true)
  if index ~= nil then
    return string.sub(str, index-1)
  end

  return nil
end
