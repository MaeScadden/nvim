local plenary = require("plenary")

local utils = {}

function utils:err(str) error ("[Tpain] [ERROR] - " .. str) end
function utils:debug(str) error ("[Tpain] [DEBUG] - " .. str) end
function utils:info(str) print ("[Tpain] [INFO] - " .. str) end


local TPain = {}

function TPain:new(...)
  local args = {...}

  utils:info("Hi From Tpain")
end


local function setup()
  -- 0: is this listed or not "Sets 'buflisted'"
  -- 1: is this a scratch buffer, (ie, is this a throwaway buffer, essentially
  --   this is unmodifiable
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
end

return {
  setup = setup,
  Tpain = Tpain
}

