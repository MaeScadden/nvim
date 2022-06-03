local set = require("utils").set
local key_bindings = require "lsp/utils/key_bindings"
local commands = require "lsp/utils/commands"

return {
  on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)
    set({"n"}, "<Leader>c", ":RustTest<CR>");
    set({"n"}, "<Leader>f", ":Ctest %<CR>");
    set({"n"}, "<Leader>p", ":Ctest<CR>");
    commands.Use(true)
  end
}
