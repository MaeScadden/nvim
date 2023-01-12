return function()
  local builtin             = require('telescope.builtin')
  local update_project_root = require("utils.update_project_root")
  local get_project_root    = require("utils.get_project_root")

  update_project_root()
  local root = get_project_root()

  if root == nil then
    root = require('telescope.utils').buffer_dir()
  end

  builtin.live_grep({
    cwd = root
  })
end
