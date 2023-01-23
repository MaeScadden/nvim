-- vim.api.nvim_create_user_command("Man", function(arg)
  --[[
  local item = arg.fargs[2]

  if item == nil then
    error("unable to run man on empty command")
    return
  end

  vim.cmd(":vsplit")
  local result = vim.api.nvim_cmd({
    cmd = "!man -w " .. item
  })

  vim.cmd(":e" .. result)
  --]]
-- end, {})
