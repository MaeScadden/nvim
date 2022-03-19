vim.api.nvim_set_keymap(
  'n',
  '<leader>S',
  '<cmd>lua require(\'spectre\').open_visual({ select_word = true })<CR>',
  {}
)
