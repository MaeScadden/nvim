vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
vim.lsp.diagnostic.on_publish_diagnostics, {
  -- Enable underline, use default values
  underline = true,
  -- Enable virtual text only on Warning or above, override spacing to 2
  virtual_text = {
    spacing = 2,
    severity_limit = "Warning",
  },
}
)
