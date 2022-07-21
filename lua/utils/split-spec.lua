local describe = require "tests/describe"
local split = require "utils/split"

return describe("split", function(c)
  c.it("should split strings at the delimiter correctly", function()
    local from = "a,b,c,d"
    local expected = {"a", "b", "c", "d"}
    local received = split(from, ",")
    for index, _ in pairs(received) do
      if received[index] ~= expected[index] then
        return string.format(
          "expected[%s] (%s) == received[%s] (%s)",
          index,
          expected[index],
          index,
          received[index]
        )
      end
    end
  end)
end)
