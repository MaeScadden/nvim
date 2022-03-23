return function(use)
  -- use <leader>+; to auto generate when hovering over a function or class
  -- or use :Neogen
  use {
    "danymat/neogen",
     requires = "nvim-treesitter/nvim-treesitter",
  }
end
