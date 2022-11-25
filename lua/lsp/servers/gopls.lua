local set_key_binding = require "utils.set_key_binding"
local key_bindings = require "lsp.utils.key_bindings"
local commands = require "lsp.utils.commands"

return {
  on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)
    set_key_binding({"n"}, "<Leader>f", ":!go test %<CR>");
    set_key_binding({"n"}, "<Leader>p", ":!go test ./...<CR>");

    commands.Use(true)
  end
}
