local opt = vim.opt

opt.cmdheight       = 1
opt.tabstop         = 2
opt.shiftwidth      = 2
opt.numberwidth     = 4
opt.showtabline     = 0
opt.laststatus      = 3
opt.winminwidth     = 10
opt.winwidth        = 1000
opt.equalalways     = false
opt.foldnestmax     = 10
opt.foldlevelstart  = 10
opt.updatetime      = 200
opt.timeoutlen      = 500
opt.textwidth       = 100
opt.colorcolumn     = "+1"
-- opt.winbar          = "%m %f"
-- opt.cmdheight       = 0
opt.syntax          = "on"
opt.encoding        = "UTF-8"
opt.signcolumn      = "yes"
opt.foldmethod      = "manual"
opt.clipboard       = "unnamedplus"
opt.matchpairs      = "(:),{:},[:],<:>"
opt.splitright      = true
opt.expandtab       = true
opt.showmatch       = true
opt.ignorecase      = true
opt.smartcase       = true
opt.smartindent     = true
opt.number          = true
opt.relativenumber  = true
opt.wildmenu        = true
opt.foldenable      = true
opt.wrap            = true
opt.linebreak       = true
opt.ruler           = true
opt.hidden          = false
opt.swapfile        = false
opt.showmode        = false

vim.cmd             "set nocursorline"
vim.cmd             "set path+=**"
vim.cmd             "set list listchars+=trail:-"
vim.cmd             "set formatoptions-=ro"
vim.cmd             "filetype indent plugin on"
