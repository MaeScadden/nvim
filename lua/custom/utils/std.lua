local encoding = {}
local types = {}
local io = {}

function encoding:new()
  self.__index = self
  return setmetatable({}, self)
end

function types:new()
  self.__index = self
  return setmetatable({}, self)
end

function io:new()
  self.__index = self
  return setmetatable({}, self)
end

function encoding:json(value)
  return "not implemented"
end

function types:is_array(value)
  if type(value) ~= "table" then
    return false
  end

  for key in pairs(value) do
    if type(key) ~= "number" then
      return false
    end
  end

  return true
end

function io:cout(...)
  local result

  for key, value in ipairs(tableWithData) do
      -- prepare json key-value pairs and save them in separate table
      table.insert(result, string.format("\"%s\":%s", key, value))
  end

  -- get simple json string
  result = "{" .. table.concat(result, ",") .. "}"
end

local a = { [1] = "Hi", [2] = "hello" }
local b = { "Hi", "hello" }
local c = { "Hi", "hello", wow = 3 }
local d = { "Hi", "hello", [3] = 3 }
local e = { [4] = "wow", name = "foow" }
local f = { name = "foow", age = 13 }

assert(types:is_array(a), "a !is_array")
assert(types:is_array(b), "b !is_array")
assert(not types:is_array(c), "c is_array")
assert(types:is_array(d), "d !is_array")
assert(not types:is_array(e), "e is_array")
assert(not types:is_array(f), "f is_array")

return {
  types = types:new(),
  encoding = encoding:new(),
  io = io:new()
}
