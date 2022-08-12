local keymap = require "utils.keymap"
local key_bindings = require "lsp/utils/key_bindings"
local commands = require "lsp/utils/commands"

return {
  on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)

    keymap({"n"}, "<leader>i", ":!terraform init<CR>")
    keymap({"n"}, "<leader>f", ":!terraform validate<CR>")
    keymap({"n"}, "<leader>p", ":!terraform plan<CR>")
    keymap({"n"}, "<leader>c", ":!terraform apply -auto-approve<CR>")

    commands.Use(true)
  end
}
