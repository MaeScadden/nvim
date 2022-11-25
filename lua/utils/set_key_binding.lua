return function(modes, key, action)
  for _, mode in ipairs(modes) do
    vim.api.nvim_set_keymap(mode, key, action, {
      noremap = true,
      silent = true
    })
  end
end
