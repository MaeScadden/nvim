vim.api.nvim_set_keymap('n', '<C-e>', '<cmd>:NnnPicker %:p:h<CR>', {})

require("nnn").setup{
	replace_netrw = 1,
}

-- au :NnnPicker %:p:

