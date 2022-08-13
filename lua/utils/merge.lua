local function merge(t1, t2)
  local arr = {}
  for _, value in pairs(t1) do
    table.insert(arr, value)
  end

  for _, value in pairs(t2) do 
    table.insert(arr, value)
  end

  return arr
end

return merge
