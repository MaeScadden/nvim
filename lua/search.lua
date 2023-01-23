local telescope = require "telescope"

local function git_root()
  local cmd = "!git rev-parse --show-toplevel"
  local result = vim.split(vim.api.nvim_exec(cmd, true), "\n")
  local dir = result[3]
  return dir
end

local function use_root()
  local path = git_root() or require('telescope.utils').buffer_dir()
  if path ~= nil then
    vim.fn.chdir(vim.fn.expand(path))
  end
  return path 
end

vim.keymap.set("n", "<leader>f", function()
  require('telescope.builtin').find_files({
    cwd = use_root(),
    hidden = true,
    files = true,
    ignore = true
  })
end)

vim.keymap.set("n", "<leader>r", function()
  require('telescope.builtin').live_grep({
    cwd = use_root()
  })
end)
