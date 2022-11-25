local function byte(character, index)
  return string.byte(character, index == nil and 1 or index)
end
local DIR_FLAG = byte("d")
local R_FLAG = byte("r")
local W_FLAG = byte("w")
local X_FLAG = byte("x")

local function get_resource_permissions(is_dir, r_flag, w_flag, x_flag)
  local read = r_flag == R_FLAG
  local write = w_flag == W_FLAG

  local permissions = {
    read = read,
    write = write
  }

  local key = is_dir and "traversable" or "executable"
  permissions[key] = x_flag == X_FLAG

  return permissions
end

-- permissions_str = "drwxr-xr-x"
local function get_permissions(str)
  print(type(str), str)
  local is_dir = byte(str, 1) == DIR_FLAG

  return {
    is_dir = is_dir,
    is_file = not is_dir,
    owner = get_resource_permissions(is_dir, byte(str, 2), byte(str, 3), byte(str, 4)),
    group = get_resource_permissions(is_dir, byte(str, 5), byte(str, 6), byte(str, 7)),
    others = get_resource_permissions(is_dir, byte(str, 8), byte(str, 9), byte(str, 10)),
  }
end

return get_permissions
