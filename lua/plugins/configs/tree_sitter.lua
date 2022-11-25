return {
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  config = function()
    local ts = require "nvim-treesitter.configs"

    ts.setup({
      highlight = {
        enable = true,
        disable = { "typescript" }
      }
    });
  end
}
