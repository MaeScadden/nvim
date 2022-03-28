local opt = vim.opt

-- vim settings here...
-- if you want to know what is happening:
-- type `:h <name>`
-- where <name> is opt.<name>

-- see :h clipboard for more info
opt.laststatus      = 0
opt.cmdheight       = 1
opt.tabstop         = 2
opt.shiftwidth      = 2
opt.numberwidth     = 4
opt.foldnestmax     = 10
opt.foldlevelstart  = 10
opt.updatetime      = 200
opt.timeoutlen      = 500

opt.syntax          = "on"
opt.encoding        = "UTF-8"
opt.signcolumn      = "yes"
opt.foldmethod      = "manual"
opt.clipboard       = "unnamedplus"
opt.matchpairs      = "(:),{:},[:],<:>"

opt.splitright       = true
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
opt.cursorline      = false


-- vim.cmd will run the code as a vimscript

-- format options:
-- -r add comments automatically in insert mode on newline
-- -o add comment line automatically when adding a new line in normal mode (o and O)
vim.cmd('set formatoptions-=ro')
vim.cmd('filetype indent plugin on')

-- Color matching parenthises
-- vim.cmd('hi clear MatchParen')
-- vim.cmd('hi MatchParen cterm=bold gui=bold')
