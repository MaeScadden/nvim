return function(list, delim)
  local str = ""

  for _, value in pairs(list) do
    str = str .. delim .. value
  end

  return str
end
