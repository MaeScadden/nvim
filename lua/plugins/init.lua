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
  {
    "ms-jpq/coq_nvim",
    lazy = false,
    enabled = true,
    branch = "coq",
    name = "coq",
    priority = 100,
    build = function()
      vim.cmd ":COQdeps"
    end,
    config = function()
    end,
    init = function()
      vim.g.coq_settings = {
        auto_start = "shut-up",
        ["keymap.jump_to_mark"] = "<leader>j",
        ["completion.always"] = false,
      }
    end
  }
})

