local execute = require "utils.execute"

local function interprete()
  -- nvim_buf_get_text
  local path = vim.api.nvim_buf_get_name(0)
  local result = execute(string.format("!node %s", path))

  vim.cmd('botright split')
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, result)
  vim.api.nvim_win_set_buf(win, buf)
  vim.api.nvim_win_set_height(win, 15)
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>v",
  "",
  { callback = interprete }
)
