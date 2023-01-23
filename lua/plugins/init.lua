local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  unpack(require("configs.color")),
  unpack(require("configs.project_rooter")),
  unpack(require("configs.mini_utils")),
  unpack(require("configs.git")),
  unpack(require("configs.language")),
  unpack(require("configs.search")),
  unpack(require("configs.lsp")),
})

