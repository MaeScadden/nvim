vim.cmd [[
  set clipboard=unnamedplus
  filetype plugin on
  let g:netrw_liststyle=3
  set splitright
  set timeoutlen=500
  set tabstop=2
  set numberwidth=4
  set signcolumn=number
  set expandtab
  set showmatch
  set shiftwidth=2
  set matchpairs=(:),\[:\],{:},<:>
  hi clear MatchParen 
  hi MatchParen cterm=underline gui=underline
  set ignorecase
  set smartcase
  set smartindent
  set foldmethod=indent
  set number
  set relativenumber
  set wildmenu
  set foldenable
  set foldlevelstart=10
  set foldnestmax=10
  set nohidden
  set noswapfile
  set formatoptions-=ro
  set updatetime=200
  set wrap
  set linebreak
  set timeoutlen=500
  set laststatus=0
  set ruler
  set noshowmode
  set nocursorline
  set cmdheight=1
]]
