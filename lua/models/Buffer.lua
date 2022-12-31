local is_table = require "utils.is_table"
local is_nil = require "utils.is_nil"
local printf = require "utils.printf"
local AuCallbackArgs = require "models.AuCallbackArgs"
local Buffer = {}

function Buffer:new(buflisted, is_scratch)
  self.is_scratch = true
  self.buf = vim.api.nvim_create_buf(buflisted, self.is_scratch)

  if self.buf == 0 then
    error("Failed to create buffer")
  end

  self.windows = {}

  return self
end

function Buffer:set_modifiable(modifiable)
  vim.api.nvim_buf_set_option(self.buf, 'modifiable', modifiable)
end

function Buffer:write(lines)
  self:set_modifiable(true)
  vim.api.nvim_buf_set_lines(self.buf, 0, 0, true, lines or {})
  self:set_modifiable(false)
end

function Buffer:attach_to(win)
    self.windows[#self.windows + 1] = win
    vim.api.nvim_win_set_buf(win, self.buf)
end

function Buffer:au(events, callback)
  vim.api.nvim_create_autocmd(
    events,
    {
      buffer = self.buf,
      callback = function(opts)
        local args = AuCallbackArgs:new(opts)
        callback(args)
      end
    }
  )
end

function Buffer:keymap(lhs, callback, noremap)
  if is_table(lhs) then
    for _, binding in pairs(lhs) do
      self:keymap(binding, callback, noremap)
    end

    return
  end

  local opts = {
    noremap = is_nil(noremap) and true or noremap,
    callback = callback
  }

  vim.api.nvim_buf_set_keymap(self.buf, "n", lhs, "", opts)
end

function Buffer:name()
  return vim.api.nvim_buf_get_name(self.buf)
end

function Buffer:set_name(name)
  self:set_modifiable(true)
  local result = vim.api.nvim_buf_set_name(self.buf, name)
  self:set_modifiable(false)

  return result
end

return Buffer
