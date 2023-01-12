require "plugins.setup"

require("lazy")
  .setup(
    require("plugins.configs"),
    require("plugins.opts")
  )
