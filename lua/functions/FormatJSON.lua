vim.cmd [[
  augroup COMMANDS
    autocmd!
    command FormatJSON call FormatJSON()
  augroup END

  function! FormatJSON()
    :%!jq .
  endfunction
]]