local modes = {
  "test",
  "git",
  "search",
}

local Hydra = require "hydra"

for _, path in pairs(modes) do
  local opt = require("plugins.mae.modes." .. path)

  Hydra(opt)
end
