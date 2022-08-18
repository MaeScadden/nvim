return function(path)
  if vim.fn.filereadable(path) == 1 then
    return true
  end

  return vim.fn.isdirectory(path) == 1
end
