local key_bindings = require "lsp.utils.key_bindings"
local commands = require "lsp.utils.commands"

return {
  settings = {
    cmd = "/usr/local/bin/lua-language-server",
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)
    commands.Use()
  end
}
