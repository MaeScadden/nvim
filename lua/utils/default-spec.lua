local describe = require "tests/describe"
local default = require "utils/default"

return describe("default", function(c)
  c.it("defaults to first argument when not nil", function()
    local a = "<a>"
    local b = "<b>"
    local result = default(a, b)

    if result ~= a then
      return string.format("1st argument[%s] ~= result[%s]", a, result)
    end
  end)

  c.it("defaults to second argument when first is nil", function()
    local b = "<b>"
    local result = default(nil, b)

    if result ~= b then
      return string.format("1st argument[%s] ~= result[%s]", a, result)
    end
  end)
end)

