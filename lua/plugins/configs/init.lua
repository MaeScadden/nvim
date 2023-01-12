local M = {}

function M.push(config)
  M[#M+1] = config;
end

M.push({
  "rebelot/kanagawa.nvim",
  config = function()
    vim.cmd "colorscheme kanagawa"
  end
})

M.push({ "nvim-treesitter/nvim-treesitter-angular" })

return M
