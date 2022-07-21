local describe = require "tests/describe"
local every = require "utils/every"

return describe("every", function(c)
  c.it("should return a function", function()
    local returned_type = type(every())

    if returned_type ~= "function" then
      return string.format("expected return type of function got %s", returned_type)
    end
  end)

  c.describe("every(callback)(list)", function(c)
    c.it("should call the callback for every item in the list until a false case", function()
      local counter = 0
      every(function ()
        counter = counter + 1
        return counter ~= 9
      end)({1,2,3,4,5,6,7,8,9,10})

      if counter ~= 9 then
        return string.format("expected counter[%s] to be 9", counter)
      end
    end)

    c.it("should stop at first false case and return false", function()
      local counter = 0
      local matched = every(function (value)
        counter = counter + 1
        return value == true
      end)({true, true, true, false, true, true})

      if matched ~= false then
        return string.format("expected matched = false but got %s", matched)
      end

      if counter ~= 4 then
        return string.format("expected counter[%s] to be 4", counter)
      end
    end)

    c.it("should return true when every case is true", function()
      local counter = 0
      local matched = every(function (value)
        counter = counter + 1
        return value == true
      end)({true, true, true, true, true, true})

      if counter ~= 6 then
        return string.format("expected counter[%s] to be 6", counter)
      end

      if matched ~= true then
        return string.format("expected matched = true, but got %s", matched)
      end
    end)

    c.it("should pass arguments in this order callback(value, key)", function()
      local expected_key = "name_1"
      local expected_value = "<name>"

      local matched = every(function (value, key)
        return key == expected_key and value == expected_value
      end)({
        [expected_key] = expected_value,
      })

      if matched ~= true then
        return string.format("expected matched = true, but got %s", matched)
      end
    end)
  end)
end)
