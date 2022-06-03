local set = require("utils").set
local key_bindings = require "lsp/utils/key_bindings"
local commands = require "lsp/utils/commands"

return {
  on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)

    set({"n"}, "<leader>i", ":!terraform init<CR>")
    set({"n"}, "<leader>f", ":!terraform validate<CR>")
    set({"n"}, "<leader>p", ":!terraform plan<CR>")
    set({"n"}, "<leader>c", ":!terraform apply -auto-approve<CR>")

    commands.Use(true)
  end
}
