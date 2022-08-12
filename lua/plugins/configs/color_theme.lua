
return {
  "ellisonleao/gruvbox.nvim",
  config = function()
    vim.g.gruvbox_sign_column = "bg0"
    vim.g.gruvbox_contrast_dark = "hard"
    vim.g.background = "dark"

    vim.cmd "colorscheme gruvbox"
  end
}
