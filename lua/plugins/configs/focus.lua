return { -- auto resizing of splits
  "beauwilliams/focus.nvim",
  config = function()
    require("focus").setup({
      minwidth = 20,
      width = 390
    })
  end
}
