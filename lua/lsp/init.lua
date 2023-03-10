require "lsp.ui"
-- require "coq"

for _, server in pairs({
  "eslint",
  "pyright",
  -- "tailwindcss",
  "tsserver",
  "rust_analyzer",
  "java_language_server",
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

