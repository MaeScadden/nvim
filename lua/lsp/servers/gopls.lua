local set = require("utils").set
local key_bindings = require "lsp/utils/key_bindings"
local commands = require "lsp/utils/commands"

return {
  on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)
    -- TODO: figureout how to leverage tree sitter here
    -- set({"n"}, "<Leader>c", ":RustTest<CR>");
    set({"n"}, "<Leader>f", ":!go test %<CR>");
    set({"n"}, "<Leader>p", ":!go test ./...<CR>");

    commands.Use(true)
  end
}
