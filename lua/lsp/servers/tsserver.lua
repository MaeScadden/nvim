local key_bindings = require "lsp/utils/key_bindings"
local commands = require "lsp/utils/commands"

return {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false 
    client.resolved_capabilities.document_range_formatting = false

    key_bindings.Use(client, bufnr)
    commands.Use()
  end
}
