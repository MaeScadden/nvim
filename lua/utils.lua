local set_key = vim.api.nvim_set_keymap
local options = {
  -- noremap just makes sure we dont trigger anything else ie if we had this:
  -- if we do  `noremap j J` 
  -- and we do `noremap J <some action>`
  -- pressing: "j" will not trigger the action
  noremap = true,
  silent = true
}

local function set(modes, key, action)
  for _, mode in ipairs(modes) do
    set_key(mode, key, action, options)
  end
end

return {
  set = set,
}
