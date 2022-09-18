local keymap = require "utils/keymap"

local bindings = {
  -- disable ctrl-[ and ctrl-] as we replace those with H and L 
  {{"n"}, "<C-[>", "<Nop>"},
  {{"n"}, "<C-]>", "<Nop>"},
  -- disable arrow keys
  {{"n", "i", "v"}, "<Up>", "<Nop>"},
  {{"n", "i", "v"}, "<Down>", "<Nop>"},
  {{"n", "i", "v"}, "<Right>", "<Nop>"},
  {{"n", "i", "v"}, "<Left>", "<Nop>key"},
  -- move lines up or down
  {{"n"}, "<A-k>", ":m .-2<CR>=="},
  {{"i"}, "<A-k>", "<Esc>:m .-2<CR>==gi"},
  {{"n"}, "<A-j>", ":m .+1<CR>=="},
  {{"i"}, "<A-j>", "<Esc>:m .+1<CR>==gi"},
  -- navigation: page down and up, auo center
  {{"n", "v"}, "<S-h>", "Hzz"},
  {{"n", "v"}, "<S-l>", "Lzz"},
  -- navigation: quick split jump
  {{"n"}, "<C-h>", "<C-W>h"},
  {{"n"}, "<C-j>", "<C-W>j"},
  {{"n"}, "<C-k>", "<C-W>k"},
  {{"n"}, "<C-l>", "<C-W>l"},
  -- navigation: split resize
  {{"n"}, "<A-S-h>",  "5<C-w><"},
  {{"n"}, "<A-S-j>",  "5<C-w>+"},
  {{"n"}, "<A-S-k>",  "5<C-w>-"},
  {{"n"}, "<A-S-l>",  "5<C-w>>"},
  -- navigation: open netrw in the ~/todo directory
  {{"n"}, "<leader>o", ":Ex ~/todo<CR>"},
  -- toggle line numbers, defined in functions.lua
  {{"n"}, "<leader>l", ":call NumberToggle()<CR>"},
  -- open :netrw
  {{"n"}, "<leader>e", ":Ex <CR>"},
}

for _, opts in pairs(bindings) do
  keymap(opts[1], opts[2], opts[3])
end
