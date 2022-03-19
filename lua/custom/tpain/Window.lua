local Window = {
}

function Window:bordered(width, height)
  local border_buf = api.nvim_create_buf(false, true)

  local border_lines = { '╔' .. string.rep('═', width) .. '╗' }
  local middle_line = '║' .. string.rep(' ', width) .. '║'

  for i=1, height do
    table.insert(border_lines, middle_line)
  end

  table.insert(border_lines, '╚' .. string.rep('═', win_width) .. '╝')

  api.nvim_buf_set_lines(border_buf, 0, -1, false, border_lines)

local border_win = api.nvim_open_win(border_buf, true, border_opts)
win = api.nvim_open_win(buf, true, opts)
api.nvim_command('au BufWipeout <buffer> exe "silent bwipeout! "'..border_buf)
end

local border_opts = {
  style = "minimal",
  relative = "editor",
  width = win_width + 2,
  height = win_height + 2,
  row = row - 1,
  col = col - 1
}

function Window:scratch(content_str)
  local buf = api.nvim_create_buf(false, true)
  -- 0: width, 1: height, 2: h ui-option
  local attached = vim.nvim_ui_attach(400, 400, {
    ext_popupmenu = true
  })

  api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')

  -- get dimensions
  local width = api.nvim_get_option("columns")
  local height = api.nvim_get_option("lines")

  -- calculate our floating window size
  local win_height = math.ceil(height * 0.8 - 4)
  local win_width = math.ceil(width * 0.8)

  -- and its starting position
  local row = math.ceil((height - win_height) / 2 - 1)
  local col = math.ceil((width - win_width) / 2)

  -- set some options
  local opts = {
    style = "minimal",
    relative = "editor",
    width = win_width,
    height = win_height,
    row = row,
    col = col
  }

  -- and finally create it with buffer attached
  win = api.nvim_open_win(buf, true, opts)

  return win
end

return Window
