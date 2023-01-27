local function map(mode, lhs, rhs, callback)
  vim.keymap.set(mode, lhs, rhs, opts, { noremap = true, silent = true, callback = callback })
end

map("n", "<C-h>", "<C-W>h")
map("n", "<C-j>", "<C-W>j")
map("n", "<C-k>", "<C-W>k")
map("n", "<C-l>", "<C-W>l")
map("n", "<S-h>", "Hzz")
map("v", "<S-h>", "Hzz")
map("n", "<S-l>", "Lzz")
map("v", "<S-l>", "Lzz")
map("n", "gm", "`Mzz")
map("v", "gm", "`Mzz")
map("n", "mm", "mM")
map("v", "mm", "mM")
map("n", "<leader>e", ":Exp<CR>")
map("n", "<leader>o", ":e ~/.todo/_todo<CR>")
map("n", "<leader>l", "", function()
  local flag = vim.opt.relativenumber._value
  -- vim.opt.norelativenumber = flag
  vim.opt.relativenumber = not flag
  print(vim.inspect({flag = flag}))
end)
