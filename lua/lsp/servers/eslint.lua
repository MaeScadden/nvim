local key_bindings = require "lsp.utils.key_bindings"
local commands = require "lsp.utils.commands"

return {
 on_attach = function(client, bufnr)
    key_bindings.Use(client, bufnr)
    vim.cmd([[
    augroup EslintCommands
       autocmd!
       autocmd BufWritePre * ++nested EslintFixAll
    augroup END
    ]])
 end
}
