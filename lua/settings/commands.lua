vim.cmd [[
  augroup COMMANDS
    autocmd!

    " autocmd VimEnter * call SetupLightlineColors()

    command FormatJSON call FormatJSON()
    command FormatEslint call FormatEslint()
    command GPushUp call GPushUp()
    command GPushO call GPushO()

  augroup END

  augroup REMEMBER_FOLDS 
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd BufWinEnter *.* silent! loadview
  augroup END

  " --- FUNCTIONS --- "

  function SetupLightlineColors() abort
    " transparent background in statusbar
    let l:palette = lightline#palette()

    let l:palette.normal.middle = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
    let l:palette.normal.right = [ [ 'NONE', 'NONE', 'NONE', 'NONE' ] ]
    let l:palette.insert.middle = l:palette.normal.middle
    let l:palette.visual.middle = l:palette.normal.middle
    let l:palette.inactive.middle = l:palette.normal.middle
    let l:palette.tabline.middle = l:palette.normal.middle

    call lightline#colorscheme()
  endfunction

  function! FormatJSON()
    :%!jq .
  endfunction

  function! FormatEslint()
    :EslintFixAll
    :w
  endfunction

  function! GPushUp()
    :Git -c push.default=current push
  endfunction

  function! GPushO()
    :G -c push.default=current push
  endfunction
]]

-- Load packer stuff automatically
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost load.lua source <afile> | PackerSync
  augroup end
]]
