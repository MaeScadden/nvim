local LspManager = require "lsp.LspManager"

local function format_on_save()
  vim.cmd([[
    augroup EslintCommands
       autocmd!
       autocmd BufWritePre * ++nested EslintFixAll
    augroup END
  ]])
end

return {
 on_attach = function(client, bufnr)
    local manager = LspManager:new(client, bufnr)
    manager:setup({ formatting = false })

    format_on_save()
 end
}
