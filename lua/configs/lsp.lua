return {
  {
    "neovim/nvim-lspconfig",
    lazy = false
  },
  { -- Lsp Loading Icon
    "j-hui/fidget.nvim",
    lazy = false,
    config = true
  },
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
}
