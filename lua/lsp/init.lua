require "lsp.ui"

for _, server in pairs({
  "eslint",
  -- "pyright",
  -- "tailwindcss",
  "tsserver",
  "rust_analyzer",
  -- "csharp_ls",
  -- "terraformls",
  -- "dartls",
  -- "terraformls",
  -- "tflint",
  -- "gopls",
  -- "svelte",
  "angularls",
  -- "ocamlls",
  "clangd",
  -- "elixirls",
}) do
  local config = require("lsp.servers." .. server)
  require("lspconfig")[server].setup(config)
end

