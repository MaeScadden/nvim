local cmd = require('hydra.keymap-util').cmd

local mode = require "plugins.mae.mode"
local hint = require "plugins.mae.modes.dir_jump.hint"

local bindings = {
  {"o", require("plugins.mae.modes.dir_jump.todo") },
  {"n", require("plugins.mae.modes.dir_jump.config") },
  {"w", require("plugins.mae.modes.dir_jump.work") },
  {"p", require("plugins.mae.modes.dir_jump.projects") },
}

return mode("n", "<leader>o", hint, bindings, nil)
