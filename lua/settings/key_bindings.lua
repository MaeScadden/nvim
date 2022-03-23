local set_key = vim.api.nvim_set_keymap
local options = {
  -- noremap just makes sure we dont trigger anything else ie if we had this:
  -- if we do  `noremap j J` 
  -- and we do `noremap J <some action>`
  -- pressing: "j" will not trigger the action
  noremap = true,
  silent = true
}

local function set(modes, key, action)
  for _, mode in ipairs(modes) do
    set_key(mode, key, action, options)
  end
end

-- disable arrow keys, learn vim properly
set({"n", "i", "v"}, "<Up>", "<Nop>")
set({"n", "i", "v"}, "<Down>", "<Nop>")
set({"n", "i", "v"}, "<Right>", "<Nop>")
set({"n", "i", "v"}, "<Left>", "<Nop>key")

-- Allow moving lines up with Alt+k
-- set({"n"}, "<A-k>", "ma :m 'a-2<CR>")
set({"n"}, "<A-k>", ":m .-2<CR>==")
set({"i"}, "<A-k>", "<Esc>:m .-2<CR>==gi")

-- Allow moving lines up with Alt+j
set({"n"}, "<A-j>", ":m .+1<CR>==")
set({"i"}, "<A-j>", "<Esc>:m .+1<CR>==gi")

-- quick jump between windows
set({"n"}, "<C-h>", "<C-W>h")
set({"n"}, "<C-j>", "<C-W>j")
set({"n"}, "<C-k>", "<C-W>k")
set({"n"}, "<C-l>", "<C-W>l")

-- quick jsdoc generate
set({"n"}, "<A-;>", ":Neogen<CR>")
set({"n"}, "<leader>o", ":vsplit ~/todo<CR>")

-- multi cursor on ctrl d (:h visual-multi)
set({"n"}, "<C-d>", "<C-n>")

-- toggle hard mode (forces you to not use hjkl so much)
set({"n"}, "<leader>h", "<Esc>:call ToggleHardMode()<CR>")

-- when you have the quickfix list window open, press dd to delete the item from the list
vim.cmd [[
  function! RemoveQFItem()
    let curqfidx = line('.') - 1
    let qfall = getqflist()
    call remove(qfall, curqfidx)
    call setqflist(qfall, 'r')
    execute curqfidx + 1 . "cfirst"
    :copen
  endfunction

  :command! RemoveQFItem :call RemoveQFItem()
  autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>
]]
