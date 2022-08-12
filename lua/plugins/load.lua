local packer = require('packer')
local use = packer.use

packer.init()

vim.cmd "set termguicolors"

for _, package in pairs({
  {"wbthomason/packer.nvim"},
  require("configs/file_picker"),
  require("configs/focus"),
  require("configs/color_theme"),
  require("configs/fugitive"),
  require("configs/gitsigns"),
  require("configs/hex_code_colorizer"),
  require("configs/lsp_config"),
  require("configs/lsp_diagnostic_lines"),
  require("configs/lsp_loading_icon"),
  require("configs/lsp_snippets"),
  require("configs/lsp_suggestion"),
  require("configs/multi_modes"),
  require("configs/project_find_and_replace"),
  require("configs/rust_support"),
  require("configs/tailwind_colorizer"),
  require("configs/telescope"),
  require("configs/tree_sitter"),
}) do
  use(package)
end
