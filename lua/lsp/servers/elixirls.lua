local LspManager = require "lsp.LspManager"

return {
  cmd = { "/Users/carter/.language-servers/elixir_lang_server.sh", },
  on_attach = function(client, bufnr)
    local manager = LspManager:new(client, bufnr)
    manager:setup()
  end
}
