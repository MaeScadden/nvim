return function map(table, callback)
  local t = {}

  for key, value in pairs(list) do
    t[#t+1] = callback(value, key, table)
  end

  return t
end
