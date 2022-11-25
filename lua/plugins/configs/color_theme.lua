return {
  "rebelot/kanagawa.nvim",
  config = function()
    vim.cmd "colorscheme kanagawa"
  end
}

--[[ CATPPUCCIN
return {
  "catppuccin/nvim",
  as = "catppuccin",
  config = function()
    vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
    local colors = require("catppuccin.palettes").get_palette() -- fetch colors from g:catppuccin_flavour palette

    local use_transparent_background = true

    if vim.fn.exists('g:neovide') then
      use_transparent_background = false
    end

    require("catppuccin").setup({
      transparent_background = use_transparent_background,
      styles = {
        comments = { "italic" },
      },
      custom_highlights = {
        Comment = { fg = colors.overlay1 },
        LineNr = { fg = colors.overlay1 },
        CursorLine = { bg = colors.none },
        CursorLineNr = { fg = colors.lavender },
        DiagnosticVirtualTextError = { bg = colors.none },
        DiagnosticVirtualTextWarn = { bg = colors.none },
        DiagnosticVirtualTextInfo = { bg = colors.none },
        DiagnosticVirtualTextHint = { bg = colors.none },
      }
    })
    vim.cmd "colorscheme catppuccin"
  end
}
--]]

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
