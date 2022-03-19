local function Use()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      -- This sets the spacing and the prefix.
      virtual_text = {
        spacing = 2,
        prefix = ' '
      }
    }
  )
end

return {
  Use = Use
}
