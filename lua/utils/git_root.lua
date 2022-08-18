local execute = require "utils.execute"

return function()
  local path = execute("!git rev-parse --show-toplevel")[3]
  if path ~= nil then
    return vim.fn.expand(path)
  end

  return nil
end
