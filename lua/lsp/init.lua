                            require "lsp/configuration/diagnostics"
                            require "lsp/configuration/highlights"
local lsp_config          = require "lspconfig"
local pretty_diagnostics  = require "lsp/utils/pretty_diagnostics"
local coq                 = require "coq"

pretty_diagnostics.Use()

for _, server in pairs({
  "eslint",
  "pyright",
  "tailwindcss",
  "tsserver",
  "rust_analyzer",
  -- "omnisharp"
  "csharp_ls",
  "terraformls",
  "dartls",
  "terraformls",
  "tflint",
  "gopls",
  "svelte",
  "angularls",
}) do
  local config = require ("lsp/servers/" .. server)
  lsp_config[server].setup(coq.lsp_ensure_capabilities(config))
end

