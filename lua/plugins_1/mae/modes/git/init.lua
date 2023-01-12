local cmd = require('hydra.keymap-util').cmd

local mode = require "plugins.mae.mode"
local hint = require "plugins.mae.modes.git.hint"

local bindings = {
  {"g", require("plugins.mae.modes.git.lazygit") },
  {"c", require("plugins.mae.modes.git.lazygitconfig") },
}

return mode("n", "<leader>g", hint, bindings, nil)
