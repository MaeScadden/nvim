local function js_file(path, file_type)
  local command = "execute 'noautocmd new | terminal' 'npm run test " .. path .. "'"

  vim.cmd(command)
end

local function js_project(path, file_type)
  vim.cmd "execute 'noautocmd new | terminal' 'npm run test'"
end

return function(path, file_type)
  return {
    file = function () js_file(path, file_type) end,
    project = function() js_project(path, file_type) end,
  }
end
