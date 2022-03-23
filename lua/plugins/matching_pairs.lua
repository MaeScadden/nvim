return function(use)
  -- do not underline matching <,[,{,(
  vim.cmd "hi MatchParen cterm=None gui=None"

  -- color pairs, (like rainbow colorizer from vscode)
  use "norcalli/nvim-colorizer.lua"

  -- smart pairs, autocomplete <,(,[,{
  use {
    "ZhiyuanLck/smart-pairs",
    event = "InsertEnter",
    config = function()
      require("pairs"):setup()
    end
  }
end
