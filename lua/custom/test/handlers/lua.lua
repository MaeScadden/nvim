local function lua_folder(path, file_type)
  print("No test runner found for lua")
end

local function lua_file(path, file_type)
  print("No test runner found for lua")
end

return function(path, file_type)
  return {
    file = function () lua_file(path, file_type) end,
    project = function() lua_folder(path, file_type) end,
  }
end
