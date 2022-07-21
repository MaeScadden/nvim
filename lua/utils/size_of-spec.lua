local describe = require "tests/describe"
local size_of = require "utils/size_of"

return describe("size_of", function(c)
  c.it("correctly calculates the size of a list", function()
    if size_of({"a", "b", "c", "d", "e"}) ~= 5 then
      return "expected size_of to return 5"
    end

    if size_of({"a", "b", "c"}) ~= 3 then
      return "expected size_of to return 3"
    end
  end)

  c.it("correctly calculates the size of a dict", function() 
    if size_of({a = 3, b = 2, c = {}, e = ""}) ~= 4 then
      return "expected size_of to return 4"
    end

    if size_of({bar = "foo", foo = 9}) ~= 2 then
      return "expected size_of to return 2"
    end
  end)

  c.it("correctly calculates the size of a mixed dict/list", function()
    if size_of({a = 3, b = 2, c = {}, e = "", 0, 4}) ~= 6 then
      return "expected size_of to return 6"
    end

    if size_of({"a", editor = "nvim", "c"}) ~= 3 then
      return "expected size_of to return 3"
    end
  end)
end)
