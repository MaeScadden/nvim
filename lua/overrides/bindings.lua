local os = require "conditionals.os"

local function set_key_binding(modes, key, action)
  for _, mode in ipairs(modes) do
    vim.api.nvim_set_keymap(mode, key, action, {
      noremap = true,
      silent = true,
    })
  end
end

-- disable ctrl-[ and ctrl-] as we replace those with H and L 
-- navigation: auto-center on page down and up
set_key_binding({"n"}, "<C-[>", "<Nop>")
set_key_binding({"n"}, "<C-]>", "<Nop>")
set_key_binding({"n", "v"}, "<S-h>", "Hzz")
set_key_binding({"n", "v"}, "<S-l>", "Lzz")

set_key_binding({"n"}, "<S-k>", ":m .-2<CR>==")
set_key_binding({"n"}, "<S-j>", ":m .+1<CR>==")

-- navigation: quick split jump
set_key_binding({"n"}, "<C-h>", "<C-W>h")
set_key_binding({"n"}, "<C-j>", "<C-W>j")
set_key_binding({"n"}, "<C-k>", "<C-W>k")
set_key_binding({"n"}, "<C-l>", "<C-W>l")

-- navigation: go to mark (set mark with mm)
set_key_binding({"n", "v"}, "gm", "`Mzz")
set_key_binding({"n", "v"}, "mm", "mM")

-- toggle line numbers, defined in functions.lua
set_key_binding({"n"}, "<leader>l", ":call NumberToggle()<CR>")

-- open :netrw
set_key_binding({"n"}, "<leader>e", ":Exp<CR>")
