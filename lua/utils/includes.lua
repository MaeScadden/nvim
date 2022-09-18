return function(target, want)
  if type(target) == "string" then
    return string.find(target, want)
  end

  for _, value in pairs(target) do
    if value == want then
      return true
    end
  end

  return false
end


