local get_permissions = require "plugins.mae.neorew.parse.get_permissions"

local LINES = {
  "-rw-r--r--   1 carter  staff  2341136 Jun 10 11:48 Fira Code Regular Nerd Font Complete.otf",
  "-rw-r--r--   1 carter  staff  1142992 Jun 10 11:48 Fira Code Regular Nerd Font Complete.ttf",
  "-rw-r--r--   1 carter  staff       86 Jun 10 11:48 README.md",
  "drwxr-xr-x   4 carter  staff      128 Jun 10 11:48 debug",
  "-rw-r--r--   1 carter  staff       30 Aug 12 17:32 init.vim",
  "-rwxr-xr-x   1 carter  staff     2335 Aug 11 19:07 install.sh",
  "drwxr-xr-x  12 carter  staff      384 Sep 29 18:28 lua",
  "-rwxr-xr-x   1 carter  staff      274 Aug  9 15:42 npm_servers.sh",
  "-rw-r--r--   1 carter  staff       43 Aug  5 16:45 other_lang_servers.sh",
  "drwxr-xr-x   3 carter  staff       96 Aug 13 14:25 plugin"
}

local LINE_MATCH_STR = "(%S+)%s+(%d+)%s+(%w+)%s+(%w+)%s+(%d+)%s+(%w+%s+%d+%s+%d%d:%d%d)%s+(.+)"

local function parse_line(line)
  local permissions,links,user,group,size,timestamp,name = string.match(line, LINE_MATCH_STR)

  return {
    permissions = permissions,
    links = links,
    user = user,
    group = group,
    size = size,
    timestamp = timestamp,
    name = name
  }
end

-- expects ls -l lines
local function parse(lines)
  local parsed_lines = {}

  for _, line in pairs(lines) do
    local sections = parse_line(line)

    table.insert(parsed_lines, {
      line = line,
      permissions = get_permissions(sections.permissions),
      links = links,
      user = user,
      group = group,
      size = size,
      timestamp = timestamp,
      name = name
    })
    break
  end

  return parsed_lines
end

return parse
