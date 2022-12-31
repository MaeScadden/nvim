local LspManager = require "lsp.LspManager"
local key_bindings = require "lsp.utils.key_bindings"
local commands = require "lsp.utils.commands"

return {
  on_attach = function(client, bufnr)
    local manager = LspManager:new(client, bufnr)
    manager:setup()
  end
}
