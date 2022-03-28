local pid = vim.fn.getpid()
local omnisharp_bin = "~/.lang_servers/omnisharp-roslyn/artifacts/publish/OmniSharp.Http.Driver/linux-x64/net6.0/OmniSharp"
local commands = require "lsp/utils/commands"

return {
  cmd = { "OmniSharp", "--languageserver" , "--hostPID", tostring(pid) };
  on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)
 end
}
