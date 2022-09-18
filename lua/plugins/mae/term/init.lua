local function terminal(cmd)
  vim.cmd('botright split')
  local win = vim.api.nvim_get_current_win()
  local buf = vim.api.nvim_create_buf(true, true)
  vim.api.nvim_buf_set_option(buf, 'modifiable', true)
  vim.api.nvim_buf_set_lines(buf, 0, 0, false, {
    cmd,
    "",
    "processing..."
  })

  vim.api.nvim_win_set_buf(win, buf)
  vim.api.nvim_win_set_height(win, 15)

  vim.defer_fn(function()
    local lines = vim.fn.systemlist(cmd)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  end, 50)
end

return terminal
