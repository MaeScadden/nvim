require "settings/index"
require "plugins/index"
require "lsp/init"
require "custom/index"
require "syntax/index"

local run_tests = require "tests/test"

vim.keymap.set("n", "<leader>-", run_tests)

vim.cmd "au BufRead,BufNewFile *.tmpl set ft=tmpl"
vim.cmd [[
  if has('mac')
    " set notermguicolors
  endif
]]
