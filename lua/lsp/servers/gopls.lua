local keymap = require "utils.keymap"
local key_bindings = require "lsp.utils.key_bindings"
local commands = require "lsp.utils.commands"

return {
  on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)
    keymap({"n"}, "<Leader>f", ":!go test %<CR>");
    keymap({"n"}, "<Leader>p", ":!go test ./...<CR>");

    commands.Use(true)
  end
}
