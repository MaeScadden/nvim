return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter.configs")

      ts.setup({
        highlight = {
          enable = true,
          -- disable = { "typescript" }
        }
      });
    end
  },
  { "rust-lang/rust.vim" },
  {
    "nvim-treesitter/nvim-treesitter-angular",
    dependencies = {"nvim-treesitter/nvim-treesitter"}
  }
}
