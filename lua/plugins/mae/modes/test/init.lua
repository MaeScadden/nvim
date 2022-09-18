local get_project_root = require "utils.get_project_type"
local cmd = require('hydra.keymap-util').cmd

local mode = require "plugins.mae.mode"
local hint = require "plugins.mae.modes.git.hint"

local bindings = {
  {"p", require("plugins.mae.modes.test.project").handle },
  {"f", require("plugins.mae.modes.test.file").handle },
  {"s", require("plugins.mae.modes.test.scope").handle },
}

return mode("n", "<leader>t", hind, bindings, nil)
