local M = {}

function M:is_linux()
  return vim.fn.has('unix')
end

function M:is_macos()
  return vim.fn.has('macos')
end

function M:linux(callback)
  if self:is_linux() then
    return callback()
  end

  return nil
end

function M:macos(callback)
  if self:is_macos() then
    return callback()
  end

  return nil
end

return M
