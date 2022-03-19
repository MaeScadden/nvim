local Window = require "custom/windy/Window"
local std = require "custom/utils/std"

assert(std.types:is_array({"a", "b", "c"}), "not true")

local Windy = {}

function Windy:new(window)
  local this = {
    window = window
  }

  self.__index = self

  return setmetatable(this, self)
end

function use_defaults(settings)
  local defaults = {
    border_lines = { '╔' .. string.rep('═', settings.win_width) .. '╗' },
    middle_line = { '║' .. string.rep(' ', settings.win_width) .. '║' }
  }

  return table.insert(defaults, settings)
end

function new(settings)
  if settings == nil then
    settings = {
      win_width = 400
    }
  end

  local win = Window.new(use_defaults(settings))

  local windy = Windy:new(win)

  for key, value in pairs(windy) do
    print("key[" .. key .. "]", value)
  end

  return windy
end

new()

return new 
