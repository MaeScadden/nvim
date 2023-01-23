return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
        local alpha = require "alpha"
        local startify = require "alpha.themes.startify"
        alpha.setup(startify.config)
    end
  }
}
