local cmd = require('hydra.keymap-util').cmd

local mode = require "plugins.mae.mode"
local hint = require "plugins.mae.modes.search.hint"

local bindings = {
  {"p", require("plugins.mae.modes.search.files") },
  {"r", require("plugins.mae.modes.search.grep") },
  {"e", require("plugins.mae.modes.search.explore") },
}

return mode("n", "<leader>.", hint, bindings, nil)
