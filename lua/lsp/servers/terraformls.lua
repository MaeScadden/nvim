local set_key_binding = require "utils.set_key_binding"
local key_bindings = require "lsp/utils/key_bindings"
local commands = require "lsp/utils/commands"

return {
  on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)

    set_key_binding({"n"}, "<leader>i", ":!terraform init<CR>")
    set_key_binding({"n"}, "<leader>f", ":!terraform validate<CR>")
    set_key_binding({"n"}, "<leader>p", ":!terraform plan<CR>")
    set_key_binding({"n"}, "<leader>c", ":!terraform apply -auto-approve<CR>")

    commands.Use(true)
  end
}
