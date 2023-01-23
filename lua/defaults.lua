vim.g.mapleader = "\\"

vim.opt.cmdheight = 1
-- vim.opt.cmdheight       = 0
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.numberwidth = 4
vim.opt.showtabline = 0
vim.opt.laststatus = 3
vim.opt.winminwidth = 10
vim.opt.winwidth = 1000
vim.opt.foldnestmax = 10
vim.opt.foldlevelstart = 10
vim.opt.updatetime = 200
vim.opt.timeoutlen = 500
vim.opt.textwidth = 100
vim.opt.colorcolumn = "+1"
-- vim.opt.winbar          = "%m %f"
vim.opt.syntax = "on"
vim.opt.encoding = "UTF-8"
vim.opt.signcolumn = "yes"
vim.opt.foldmethod = "manual"
vim.opt.clipboard = "unnamedplus"
vim.opt.matchpairs = "(:),{:},[:],<:>"
vim.opt.splitright = true
vim.opt.expandtab = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wildmenu = true
vim.opt.foldenable = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.ruler = true
vim.opt.equalalways = false
vim.opt.hidden = false
vim.opt.swapfile = false
vim.opt.showmode = false
vim.opt.mouse = nil
vim.opt.cursorline = false

vim.cmd [[
  set path+=**
  set list listchars+=trail:-
  set formatoptions-=ro
  filetype indent plugin on
]]
