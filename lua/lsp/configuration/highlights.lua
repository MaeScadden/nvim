vim.cmd [[
  " Errors in Red
  hi LspDiagnosticsVirtualTextError guifg=Red ctermfg=Red
  " Warnings in Yellow
  hi LspDiagnosticsVirtualTextWarning guifg=Yellow ctermfg=Yellow
  " Info and Hints in White
  hi LspDiagnosticsVirtualTextInformation guifg=White ctermfg=White
  hi LspDiagnosticsVirtualTextHint guifg=White ctermfg=White

  " Underline the offending code
  hi LspDiagnosticsUnderlineError guifg=NONE ctermfg=NONE cterm=underline gui=underline
  hi LspDiagnosticsUnderlineWarning guifg=NONE ctermfg=NONE cterm=underline gui=underline
  hi LspDiagnosticsUnderlineInformation guifg=NONE ctermfg=NONE cterm=underline gui=underline
  hi LspDiagnosticsUnderlineHint guifg=NONE ctermfg=NONE cterm=underline gui=underline
]]
