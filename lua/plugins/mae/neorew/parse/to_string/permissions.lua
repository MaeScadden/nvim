local RESOURCE_FMT_STR = [[{
      "read": %s,
      "write": %s,
      "%s": %s,
    }]]

local function format_resource(resource_permissions)
  local key = ""
  if resource_permissions.traversable ~= nil then
    key = "traversable"
  else 
    key = "executable"
  end

  return string.format(
    RESOURCE_FMT_STR,
    resource_permissions.read,
    resource_permissions.write,
    key,
    resource_permissions[key]
  )
end

local FMT_STR = [[{
    "is_dir": %s,
    "is_file": %s,
    "owner": %s,
    "group": %s,
    "others": %s,
  }]]

local function format_permissions(permissions)
  return string.format(
    FMT_STR,
    permissions.is_dir,
    permissions.is_file,
    format_resource(permissions.owner),
    format_resource(permissions.group),
    format_resource(permissions.others)
  )
end

return format_permissions
