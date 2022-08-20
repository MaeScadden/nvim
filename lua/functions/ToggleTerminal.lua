local terminal = require "plugins.mae.terminal"

vim.api.nvim_set_keymap(
  "n",
  "<leader>[",
  "",
  { callback = terminal.toggle }
)
