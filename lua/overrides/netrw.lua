vim.g.netrw_banner          = 0
vim.g.netrw_keepdir         = 0
vim.g.netrw_preview         = 1
vim.g.netrw_localcopydircmd = "cp -r"
vim.cmd "hi! link netrwMarkFile Search"

vim.cmd [[
  function! NetrwMapping()
  endfunction

  augroup netrw_mapping
    autocmd!
    autocmd filetype netrw call NetrwMapping()
  augroup END

  function! NetrwRemoveRecursive()
    if &filetype ==# 'netrw'
      cnoremap <buffer> <CR> rm -r<CR>
      normal mu
      normal mf

      try
        normal mx
      catch
        echo "Canceled"
      endtry

      cunmap <buffer> <CR>
    endif
  endfunction

  function! NetrwMapping()
    " split movement
    nmap <buffer> <C-h> <C-w>h
    nmap <buffer> <C-l> <C-w>l
    nmap <buffer> <C-j> <C-w>j
    nmap <buffer> <C-k> <C-w>k

    " hidden files
    nmap <buffer> . gh

    nmap <buffer> x :call NetrwRemoveRecursive()<CR>
  endfunction
]]
