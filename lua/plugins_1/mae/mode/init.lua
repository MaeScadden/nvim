local merge = require "utils.merge"
local default = require "utils.default"

local default_head = {
  { "q", nil, { exit = true, nowait = true } },
}

local default_config = {
  color = "teal",
  hint = {
    position = "middle",
    border = "rounded"
  },
}

local function mode(mode, body, hint, bindings, config)
  return {
    mode = mode,
    hint = hint,
    body = body,
    heads = merge(default_head, bindings),
    config = default_config,
  }
end

return mode
