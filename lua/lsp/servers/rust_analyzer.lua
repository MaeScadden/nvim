local set_key_binding = require "utils.set_key_binding"
local key_bindings = require "lsp.utils.key_bindings"
local commands = require "lsp.utils.commands"
local tests = require "plugins.mae.modes.test.use"

return {
  on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)
    -- set_key_binding({"n"}, "<Leader>c", ":RustTest<CR>");
    -- set_key_binding({"n"}, "<Leader>f", ":Ctest %<CR>");
    -- set_key_binding({"n"}, "<Leader>p", ":Ctest<CR>");

    tests.project(function()
      vim.cmd ":Ctest"
    end)

    tests.file(function()
      vim.cmd ":Ctest %"
    end)

    tests.scope(function()
      vim.cmd ":RustTest"
    end)

    commands.Use(true)
  end
}
