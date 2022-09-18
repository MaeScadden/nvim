return {
  "catppuccin/nvim",
  as = "catppuccin",
  config = function()
    vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
    require("catppuccin").setup()
    vim.cmd "colorscheme catppuccin"
  end
}
--[[ DOUBLE TROUBLE
return {
  "muchzill4/doubletrouble",
  config = function()
    vim.o.termguicolors = true
    vim.cmd "colorscheme doubletrouble"
    -- local colors = require("doubletrouble.colors")
  end,
}
--]]

--[[ GRUVBOX
return {
  "ellisonleao/gruvbox.nvim",
  config = function()
    vim.g.gruvbox_sign_column = "bg0"
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.background = "dark"

    vim.cmd "colorscheme gruvbox"
  end
}
--]]
