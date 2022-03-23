local function before()
  
end

local function after()

end

return function(use)
  before()

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

  after()
end




