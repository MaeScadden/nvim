return function(use)
  -- LSP [Live Server Protocol] (allows for code completion, go to definition, and details info
  -- of variables, functions, classes, etc
  use "neovim/nvim-lspconfig"

  -- "Standalone UI for nvim-lsp progress. Eye candy for the impatient."
  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup{}
    end
  }

  -- COQ, completion client, integrates with the lsp client and allows us to get really
  -- fast suggestions
  -- https://www.reddit.com/r/neovim/comments/pk3mlj/coqnvim_faster_prettier_even_more_features_custom/?web_redirect=true
  use {
    "ms-jpq/coq_nvim",
    branch = "coq",
    cmd = { "COQDeps" },
  }

  -- snippets
  use {
    "ms-jpq/coq.artifacts",
    branch = "artifacts"
  }

  -- Tree sitter, parses code and adds highlughting and a whole ton of functionality
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  -- rust support, adds :Cargo ... items
  use "rust-lang/rust.vim"

  -- graphql highlighting
  use "jparise/vim-graphql"

  -- tailwind css colors
  use {
    "themaxmarchuk/tailwindcss-colors.nvim",
    -- load only on require("tailwindcss-colors")
    module = "tailwindcss-colors",
    config = function ()
      require("tailwindcss-colors").setup()
    end
  }
end
