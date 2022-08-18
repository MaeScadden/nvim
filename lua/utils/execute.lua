return function(cmd)
  return vim.split(vim.api.nvim_exec(cmd, true), '\n')
end
