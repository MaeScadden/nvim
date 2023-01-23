return {
  { "kyazdani42/nvim-web-devicons" },
  {
    'echasnovski/mini.nvim',
    branch = 'stable',
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      local devicons = require "nvim-web-devicons"
      devicons.setup({ default = true })

      require("mini.statusline").setup({
        content = {
          active = function() return "%m %t%=[%v]  " end,
          inactive = function() return "%m %t%=[%v]  " end,
        },
        set_vim_settings = true,
      })
    end
  }
}
