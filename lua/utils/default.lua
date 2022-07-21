local function default(wanted, defaulted)
  if wanted ~= nil then
    return wanted
  end

  return defaulted
end

return default
