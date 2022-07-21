local function enum(enum_table)
  local e = {}

  for key, value in pairs(enum_table) do
    e[key] = vim.deepcopy(value)
    e[value] = vim.deepcopy(key)
  end

  return e
end

return enum

local sizes = enum({
  LARGE = "lg",
  MEDIUM = "md",
  SMALL = "sm",
  EXTRA_SMALL = "xs",
})
