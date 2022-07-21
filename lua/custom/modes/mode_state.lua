local MODES = require "custom/modes/models/modes-enum"
local defaul = require "custom/modes/utils/default"

for key, value in MODES do
  print(string.format("key: %s, value: %s", key, value))
end

local function create_modes(vim_modes)
  if vim_modes[MODES.NORMAL] ~= nil then

  end
end

local function mode_state(args)
  local state = {
    id = 0,
    vim_modes = default(args.modes, { MODES.NORMAL }),
    key_maps = {},
  }
end

return mode_state
