local LspManager = require "lsp.LspManager"

return {
  on_attach = function(client, bufnr)
    local manager = LspManager:new(client, bufnr)
    manager:setup()
    manager:map("<leader>c", ":RustTest<cr>")
    manager:map("<leader>f", ":Ctest %<cr>")
    manager:map("<leader>p", ":Ctest <cr>")
  end
}
