local Job = require "plenary.job"
local slice_list = require "utils.slice_list"
local parse = require "plugins.mae.neorew.parse"

local function neorew()
  local cmd = "/bin/ls -l " .. vim.fn.getcwd()

  vim.cmd('botright split')
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(true, true)
  local cmd = vim.split(cmd, ' ')

  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  vim.api.nvim_win_set_buf(win, buf)
  vim.api.nvim_win_set_height(win, 15)

  Job:new({
    command = cmd[1],
    args = slice_list(cmd, 2),
    on_exit = function(job, return_val)
      local result = job:result()
      vim.schedule(function()
        -- parse the result and store it
        --  o <Line> nothing fancy, just the simple column seperation
        --  o line_to_string(lines: Line[], config: Config)

        -- when we modify the buffer, parse it and find the difference
        --  o for now let's just practice a dd
        --  o new file
        --  o new dir

        -- 





        vim.api.nvim_buf_set_lines(buf, 0, -1, false, result)
      end)
    end,
  }):start()
end

vim.api.nvim_set_keymap(
  "n",
  "<space>o",
  "",
  {
    callback = neorew,
    noremap = true,
    silent = true
  }
)
