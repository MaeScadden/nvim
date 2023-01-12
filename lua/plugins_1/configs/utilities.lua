return {
  'echasnovski/mini.nvim',
  branch = 'stable',
  requires = {
    "kyazdani42/nvim-web-devicons",
  },
  config = function()
    local devicons = require "nvim-web-devicons"
    devicons.setup{
      default = true
    }
  end
}
