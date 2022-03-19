local key_bindings = require "lsp/utils/key_bindings"
local commands = require "lsp/utils/commands"

return {
  cmd = { "lang_server_linux.sh" },
  on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)
    commands.Use(true)
  end
}
