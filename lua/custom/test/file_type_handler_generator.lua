local file_type_handler_generator = {}

local handlers = {
  "lua",
  "js",
  "jsx",
  "ts",
  "tsx",
}

for _, name in pairs(handlers) do
  file_type_handler_generator[name] = require("custom/test/handlers/" .. name)
end

-- for d in  do
--   print(d)
-- end

return file_type_handler_generator
