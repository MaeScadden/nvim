local Window = {}
local window_defaults = {
  name = "Carter"
}

function Window:New(settings)
  local this = setmetatable({}, getmetatable(settings))
  this = setmetatable(this, getmetatable(window_defaults))
  self.__index = self
  return setmetatable(this, self)
end

function Window:update()
  -- ? should this exists or can a buffer be updated without the window
end

-- window.new
function new(...)
  -- https://www.2n.pl/blog/how-to-write-neovim-plugins-in-lua
  local win = Window:New()
  
  for key, value in pairs(win) do
    print(key, value)
  end

  return win
end

return {
  Window = Window,
  new = new,
}
