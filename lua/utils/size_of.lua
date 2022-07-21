local function size_of(table)
  local count = 0

  for _, __ in pairs(table) do
    count = count + 1
  end

  return count
end

return size_of
