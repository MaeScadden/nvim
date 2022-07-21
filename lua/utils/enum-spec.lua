local describe = require "tests/describe"
local enum = require "utils/enum"
local every = require "utils/every"

return describe("enum", function(c)
  c.it("should set all values to keys, and all keys to values", function()
    local my_enum = enum({
      ABC = "A123",
      ZYX = "A098"
    })

    local expects = {
      my_enum.ABC  == "A123",
      my_enum.ZYX  == "A098",
      my_enum.A123 == "ABC",
      my_enum.A098 == "ZYX",
    }

    local matches = every(function(value)
      return value
    end)(expects)

    if matches ~= true then
      return "enum not creating keys like expected"
    end
  end)
end)
