local modes = {
  "test",
  "git",
  "search",
  "dir_jump",
}

local Hydra = require "hydra"

for _, path in pairs(modes) do
  local opt = require("plugins.mae.modes." .. path)

  Hydra(opt)
end
