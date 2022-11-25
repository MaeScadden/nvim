vim.cmd [[
  augroup COMMANDS
    autocmd!
    command Blame call BlameFunc()
  augroup END

  function! BlameFunc()
    :Gitsigns blame_line
  endfunction
]]
