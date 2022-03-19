local packer = require "packer"

return packer.startup(function(use)
  use "wbthomason/packer.nvim"
  use "nvim-lua/plenary.nvim"

  use {
    --:TransparentToggle
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        enable = false, exclude = {},
      })
    end
  }

  -- automatically resize windows
  use {
    "beauwilliams/focus.nvim",
    config = function()
      require("focus").setup()
    end
  }

  -- smart pairs ()
  --[[
  use {
    "ZhiyuanLck/smart-pairs",
    event = "InsertEnter",
    config = function()
      require("pairs"):setup()
    end
  }
  --]]

  -- ui plugin for nice looking stuff
  use "stevearc/dressing.nvim"

  -- Git
  use "tpope/vim-fugitive"
  use {
    "lewis6991/gitsigns.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

  -- Status line
  use {
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true }
  }

  -- Theme
  use "dracula/vim"

  -- For auto gen documentation
  
  use {
    "danymat/neogen",
     requires = "nvim-treesitter/nvim-treesitter",
  }

  -- Multiple cursors!
  use {
    "mg979/vim-visual-multi",
    branch = "master"
  }

  -- LSP [Live Server Protocol]
  use "neovim/nvim-lspconfig"
  use {
    "ms-jpq/coq_nvim",
    branch = "coq"
  }

  use {
    "ms-jpq/coq.artifacts",
    branch = "artifacts"
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  }

  use {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim"
  }

  use "rust-lang/rust.vim"

  use {
    "sunjon/shade.nvim",
    config = function()
      local shade = require "shade"
      shade.setup({
        overlay_opacity = 50,
        opacity_step = 1,
        keys = {
          brightness_up    = "<C-Up>",
          brightness_down  = "<C-Down>",
          toggle           = "<Leader>s",
        }
      })
    end
  }
  use "norcalli/nvim-colorizer.lua"


  -- use {
  --   "junegunn/fzf",
  --   run = "fzf#install()"
  -- }

  -- QUICK FIX
  -- https://github.com/kevinhwang91/nvim-bqf
  use {
    "kevinhwang91/nvim-bqf",
    ft = "qt"
  }

  use "mcchrish/nnn.vim"

  -- discord presence
  use "andweeb/presence.nvim"

  -- testing
  use "mfussenegger/nvim-dap"

  use {
    "Pocco81/DAPInstall.nvim"
  }

  use {
    "rcarriga/nvim-dap-ui"
  }

  use {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  }
  use {
    "rcarriga/vim-ultest"
  }

  -- Graphql support
  use "jparise/vim-graphql"

  use {
    "themaxmarchuk/tailwindcss-colors.nvim",
    -- load only on require("tailwindcss-colors")
    module = "tailwindcss-colors",
    -- run the setup function after plugin is loaded 
    config = function ()
      -- pass config options here (or nothing to use defaults)
      require("tailwindcss-colors").setup()
    end
  }

  use {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup{}
    end
  }

  use {
    "danymat/neogen",
    requires = "nvim-treesitter/nvim-treesitter"
  }

  use "zah/nim.vim"

  use {
    "windwp/nvim-spectre",
    requires = "nvim-lua/plenary.nvim"
  }

  use "rcarriga/nvim-notify"

  use "mvllow/modes.nvim"
end)
