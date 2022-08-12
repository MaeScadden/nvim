return {
  "miversen33/netman.nvim",
  config = function()
    vim.api.nvim_set_keymap('n', '<C-e>', ":Explore<CR>", { noremap = true })
  end
}
