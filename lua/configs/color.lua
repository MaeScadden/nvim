return {
  {
    "rebelot/kanagawa.nvim",
    init = function()
      vim.cmd "colorscheme kanagawa"
    end
  },
  {
    "norcalli/nvim-colorizer.lua",
    name = "colorizer",
    config = true,
  },
  {
    "themaxmarchuk/tailwindcss-colors.nvim",
    lazy = true,
    name = "tailwindcss-colors",
    config = true,
  }
}
