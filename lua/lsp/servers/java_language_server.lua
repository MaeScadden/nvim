local key_bindings = require "lsp.utils.key_bindings"
local commands = require "lsp.utils.commands"

return {
  cmd = { "/Users/carter/.language-servers/java-language-server/dist/lang_server_mac.sh" },
  on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)
    commands.Use(true)
  end
}
