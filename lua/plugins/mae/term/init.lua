local Job = require "plenary.job"
local slice_list = require "utils.slice_list"

local function terminal(cmdstr)
  vim.cmd('botright split')
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(true, true)
  local cmd = vim.split(cmdstr, ' ')

  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  vim.api.nvim_win_set_buf(win, buf)
  vim.api.nvim_win_set_height(win, 15)

  Job:new({
    command = cmd[1],
    args = slice_list(cmd, 2),
    on_exit = function(j, return_val)
      print(return_val)
      print(j:result())

      local lines = vim.fn.systemlist(return_val)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    end,
  }):start()
end

return terminal
