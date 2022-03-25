return require('packer').startup(function(use)
  -- use :PackerSync
  use 'wbthomason/packer.nvim'


--        _ _   
--   __ _(_) |_ 
--  / _` | | __|
-- | (_| | | |_ 
--  \__, |_|\__|
--  |___/       

  use {
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      local neogit = require('neogit')

      neogit.setup {}
    end
  }

  use {
    "lewis6991/gitsigns.nvim",
    requires = "nvim-lua/plenary.nvim",
  }

--           _ _ _       
--  ___ _ __ | (_) |_ ___ 
-- / __| '_ \| | | __/ __|
-- \__ \ |_) | | | |_\__ \
-- |___/ .__/|_|_|\__|___/
--     |_|                



--                  _       _     _                           _          
--  _ __ ___   __ _| |_ ___| |__ (_)_ __   __ _   _ __   __ _(_)_ __ ___ 
-- | '_ ` _ \ / _` | __/ __| '_ \| | '_ \ / _` | | '_ \ / _` | | '__/ __|
-- | | | | | | (_| | || (__| | | | | | | | (_| | | |_) | (_| | | |  \__ \
-- |_| |_| |_|\__,_|\__\___|_| |_|_|_| |_|\__, | | .__/ \__,_|_|_|  |___/
--                                        |___/  |_|                     

  -- do not underline matching <,[,{,(
  vim.cmd "hi MatchParen cterm=None gui=None"

  -- color pairs, (like rainbow colorizer from vscode)
  use "norcalli/nvim-colorizer.lua"

  -- smart pairs, autocomplete <,(,[,{
  -- use {
  --   "ZhiyuanLck/smart-pairs",
  --   event = "InsertEnter",
  --   config = function()
  --     require("pairs"):setup()
  --   end
  -- }

--  __  __       _ _   _    ____                          
-- |  \/  |_   _| | |_(_)  / ___|   _ _ __ ___  ___  _ __ 
-- | |\/| | | | | | __| | | |  | | | | '__/ __|/ _ \| '__|
-- | |  | | |_| | | |_| | | |__| |_| | |  \__ \ (_) | |   
-- |_|  |_|\__,_|_|\__|_|  \____\__,_|_|  |___/\___/|_|   

  -- use ctrl + <up, down> to add another cursor
  use "mg979/vim-visual-multi"

--      _        _               _ _            
--  ___| |_ __ _| |_ _   _ ___  | (_)_ __   ___ 
-- / __| __/ _` | __| | | / __| | | | '_ \ / _ \
-- \__ \ || (_| | |_| |_| \__ \ | | | | | |  __/
-- |___/\__\__,_|\__|\__,_|___/ |_|_|_| |_|\___|
                                             
  use {
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
    }
  }

--  _   _                         
-- | |_| |__   ___ _ __ ___   ___ 
-- | __| '_ \ / _ \ '_ ` _ \ / _ \
-- | |_| | | |  __/ | | | | |  __/
--  \__|_| |_|\___|_| |_| |_|\___|
                               
  use "dracula/vim"
  use "morhetz/gruvbox"
  -- use "ellisonleao/gruvbox.nvim"

  -- change background color depending on the vim mode you are in
  use "mvllow/modes.nvim"

--      _                                       _        _   _             
--   __| | ___   ___ _   _ _ __ ___   ___ _ __ | |_ __ _| |_(_) ___  _ __  
--  / _` |/ _ \ / __| | | | '_ ` _ \ / _ \ '_ \| __/ _` | __| |/ _ \| '_ \ 
-- | (_| | (_) | (__| |_| | | | | | |  __/ | | | || (_| | |_| | (_) | | | |
--  \__,_|\___/ \___|\__,_|_| |_| |_|\___|_| |_|\__\__,_|\__|_|\___/|_| |_|
                                                                        
  -- use <leader>+; to auto generate when hovering over a function or class
  -- or use :Neogen
  use {
    "danymat/neogen",
     requires = "nvim-treesitter/nvim-treesitter",
  }

--  _                                             
-- | |    __ _ _ __   __ _ _   _  __ _  __ _  ___ 
-- | |   / _` | '_ \ / _` | | | |/ _` |/ _` |/ _ \
-- | |__| (_| | | | | (_| | |_| | (_| | (_| |  __/
-- |_____\__,_|_| |_|\__, |\__,_|\__,_|\__, |\___|
--                   |___/             |___/      
--  ____                               _   
-- / ___| _   _ _ __  _ __   ___  _ __| |_ 
-- \___ \| | | | '_ \| '_ \ / _ \| '__| __|
--  ___) | |_| | |_) | |_) | (_) | |  | |_ 
-- |____/ \__,_| .__/| .__/ \___/|_|   \__|
--             |_|   |_|                   

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

  use "stevearc/dressing.nvim"

--  _____ _ _         ___     _____         _     ____                      _     
-- |  ___(_) | ___   ( _ )   |_   _|____  _| |_  / ___|  ___  __ _ _ __ ___| |__  
-- | |_  | | |/ _ \  / _ \/\   | |/ _ \ \/ / __| \___ \ / _ \/ _` | '__/ __| '_ \ 
-- |  _| | | |  __/ | (_>  <   | |  __/>  <| |_   ___) |  __/ (_| | | | (__| | | |
-- |_|   |_|_|\___|  \___/\/   |_|\___/_/\_\\__| |____/ \___|\__,_|_|  \___|_| |_|
                                                                               
  -- ctrl p file search
  -- and ctrl r text search
  use {
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim"
  }

  --- nnn file picker
  use "mcchrish/nnn.vim"

  use "ryanoasis/vim-devicons"
  use "preservim/nerdtree"

  -- open with ctrl e
  -- vim.api.nvim_set_keymap("n", "<c-e>", "<cmd>NnnPicker<cr>", {
  --   noremap = true,
  --   silent = true
  -- })
  vim.api.nvim_set_keymap("n", "<c-e>", "<cmd>NERDTree<cr>", {
    noremap = true,
    silent = true
  })

  -- global replace of text, really, all this is is a gui sed
  use {
    "windwp/nvim-spectre",
    requires = "nvim-lua/plenary.nvim"
  }

  -- lightspeed vim, press s, and type the two keys where you want to go, (or if there is a repeated pattern, two keys and 1..9)
  use "ggandor/lightspeed.nvim"

--  _            _   _             
-- | |_ ___  ___| |_(_)_ __   __ _ 
-- | __/ _ \/ __| __| | '_ \ / _` |
-- | ||  __/\__ \ |_| | | | | (_| |
--  \__\___||___/\__|_|_| |_|\__, |
--                           |___/ 

  -- TODO: set this up
  -- https://www.reddit.com/r/neovim/comments/silikv/debugging_in_neovim/
  use "mfussenegger/nvim-dap"
  use "Pocco81/DAPInstall.nvim"
  use "rcarriga/nvim-dap-ui"
  use {
    "theHamsta/nvim-dap-virtual-text",
    config = function()
      require("nvim-dap-virtual-text").setup()
    end
  }
end)
