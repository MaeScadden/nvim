local keymap = require "utils.keymap"
local key_bindings = require "lsp.utils.key_bindings"
local commands = require "lsp.utils.commands"

return {
  on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)
    -- keymap({"n"}, "<Leader>c", ":RustTest<CR>");
    -- keymap({"n"}, "<Leader>f", ":Ctest %<CR>");
    -- keymap({"n"}, "<Leader>p", ":Ctest<CR>");

    tests.project(function()
      vim.cmd ":RustTest<CR>"
    end)

    tests.file(function()
      vim.cmd ":Ctest %<CR>"
    end)

    tests.scope(function()
      vim.cmd ":Ctest<CR>"
    end)

    commands.Use(true)
  end
}
