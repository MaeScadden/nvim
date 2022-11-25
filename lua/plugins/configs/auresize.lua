return {}
--[[
return {
  "anuvyklack/windows.nvim",
  requires = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  config = function()
    vim.o.winminwidth = 10
    vim.o.winwidth = 10
    vim.o.equalalways = false

    require("windows").setup({
      ignore = {
        buftype = { "quickfix" },
        filetype = { "NvimTree", "neo-tree", "undotree", "gundo" }
      },
      animation = {
        enable = true,
        duration = 200,
      }
    })
  end
}
--]]
