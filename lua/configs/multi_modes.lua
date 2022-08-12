return {
  "https://github.com/anuvyklack/hydra.nvim",
  config = function()
    local Hydra = require('hydra')

    Hydra({
       name = 'modes',
       mode = {"n"},
       on_key = function() vim.wait(50) end,
       body = '<leader>z',
       heads = {
          { 'h', '5zh' },
          { 'l', '5zl', { desc = '←/→' } },
          { 'H', 'zH' },
          { 'L', 'zL', { desc = 'half screen ←/→' } },
       }
    })
  end
}
