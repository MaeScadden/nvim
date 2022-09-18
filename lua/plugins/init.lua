local packer = require 'packer'
local use = packer.use

packer.init()

vim.cmd "set termguicolors"

for _, package in pairs({
  {"wbthomason/packer.nvim"},
  require("plugins.configs.project_rooter"),
  require("plugins.configs.utilities"),
  require("plugins.configs.focus"),
  require("plugins.configs.color_theme"),
  require("plugins.configs.git"),
  require("plugins.configs.gitsigns"),
  require("plugins.configs.hex_code_colorizer"),
  require("plugins.configs.lsp_config"),
  require("plugins.configs.lsp_loading_icon"),
  require("plugins.configs.lsp_snippets"),
  require("plugins.configs.lsp_suggestion"),
  require("plugins.configs.project_find_and_replace"),
  require("plugins.configs.rust_support"),
  require("plugins.configs.tailwind_colorizer"),
  require("plugins.configs.telescope"),
  require("plugins.configs.tree_sitter"),
  require("plugins.configs.angular_ts"),
  require("plugins.configs.multi_modes"),
}) do
  use(package)
end

require "plugins.mae.modes"
require "plugins.mae.statusline"
require "plugins.mae.api_search"
require "plugins.mae.interpreter"
