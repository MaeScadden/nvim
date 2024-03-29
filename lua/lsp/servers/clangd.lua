local LspManager = require "lsp.LspManager"

return {
  cmd = {
    "clangd",
    "--background-index",
    "--log=verbose"
  },
  on_attach = function(client, bufnr)
    local manager = LspManager:new(client, bufnr)
    manager:setup()
  end
}
