local project_root = require "utils.get_project_root"
local files_in_dir = require "utils.files_in_dir"
local includes = require "utils.includes"
local file_type = require "constants.file_type-enum"


return function()
  local root = project_root()
  local files = files_in_dir()

  if includes(files, "package.json") then
    return file_type.JavaScript
  end

  return nil
end
