local project = require "plugins.mae.modes.test.project"
local file = require "plugins.mae.modes.test.file"
local scope = require "plugins.mae.modes.test.scope"

return {
  project = project.set,
  file = file.set,
  scope = scope.set,
}
