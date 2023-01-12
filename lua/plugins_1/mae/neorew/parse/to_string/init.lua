local permissions_to_string = require "plugins.mae.neorew.parse.to_string.permissions"

local FMT_STR = [[{
  line: %s,
  permissions: %s,
  links: "%s",
  user: "%s",
  group: "%s",
  size: "%s",
  timestamp: "%s",
  name: "%s",
}]]

local function parsed_to_string(parsed)
  return string.format(
    FMT_STR,
    parsed.line,
    permissions_to_string(parsed.permissions),
    parsed.links,
    user,
    group,
    size,
    timestamp,
    name
  )
end

return parsed_to_string
