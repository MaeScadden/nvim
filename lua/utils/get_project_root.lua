local execute = require "utils.execute"
local exists = require "utils.exists"
local git_root = require "utils.git_root"

return function()
  local path = git_root()

  if path ~= nil and exists(path) then
    return path
  end

  return nil
end
