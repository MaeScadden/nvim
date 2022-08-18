local get_project_root = require "utils.get_project_root"

return function()
  local root = get_project_root()

  if root ~= nil then
    vim.fn.chdir(root)
  end
end
