require "settings/index"
require "plugins/index"
require "lsp/init"
require "custom/index"

local run_tests = require "tests/test"

vim.keymap.set("n", "<leader>-", run_tests)
