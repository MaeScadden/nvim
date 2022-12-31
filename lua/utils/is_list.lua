local is_number = require "utils.is_number"
local is_table = require "utils.is_table"

return function(arg)
  if not is_table(arg) then
    return false
  end

  for key, value in pairs(arg) do
    if not is_number(key) then
      return false
    end
  end

  return true
end
