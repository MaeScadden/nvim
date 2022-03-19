vim.cmd [[
  " stop arrow keys, learn vim correctly
  noremap <Up> <Nop>
  noremap <Down> <Nop>
  noremap <Left> <Nop>
  noremap <Up> <Nop>
  noremap <Right> <Nop>

  " line / column movement
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv

  " quick jump between windows
  nnoremap <C-h> <C-W>h
  nnoremap <C-j> <C-W>j
  nnoremap <C-k> <C-W>k
  nnoremap <C-l> <C-W>l

  " generate docs
  nmap <A-;> :Neogen<CR>

  " open ~/todo file with \ o
  nmap <leader>o :vsplit ~/todo/main.norg<CR>

  " multi cursor on ctrl d (:h visual-multi)
  nmap <C-d> <C-n>

  " hard mode enable
  nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>
]]

vim.cmd [[
" When using `dd` in the quickfix list, remove the item from the quickfix list.
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>
]]
