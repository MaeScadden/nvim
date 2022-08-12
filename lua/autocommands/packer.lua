vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost load.lua source <afile> | PackerSync
  augroup end
]]
