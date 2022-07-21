
local foo = {
  _value = {1, 2, 3, 4}
}

local function iter(given_table, clone)
  local t

  if clone == true then
    t = table.clone(given_table)
  else
    t = given_table
  end

  return {
    reduce = function(callback, default)
      local current = default

      for key, value in pairs(t) do
        -- TODO: debug
        current = callback(current, value, key, t)
      end

      return current
    end,

    foreach = function(callback)
      for key, value in pairs(t) do
        callback(value, key, t)
      end
    end,

    map = function(callback)
      local _t = {}

      for key, value in pairs(t) do
        local v = callback(value, key, t)
        _t[key] = value
      end

      return iter(_t, false)
    end,

    collect = function() return t end,
  }

end

return iter
