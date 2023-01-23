--@class LspManager
local M = {
  --_buffer = bufnr
  --_client = client
}

--@param client Client
--@param bufnr Buffer
--@returns LspManager
function M:new(client, bufnr)
  self.__index = self;

  self._buffer = bufnr
  self._client = client

  return self
end

--@params opts.goto bool
--@params opts.rename bool
--@params opts.documentation bool
--@params opts.code_actions bool
--@params opts.completion bool
--@params opts.formatting bool
function M:setup(opts)
  if opts == nil then
    M:goto()
    M:rename()
    M:documentation()
    M:code_actions()
    M:completion_menu()
    M:format_on_save()

    return
  end

  if opts.goto ~= false then M:goto() end
  if opts.rename ~= false then M:rename() end
  if opts.documentation ~= false then M:documentation() end
  if opts.code_actions ~= false then M:code_actions() end
  if opts.completion ~= false then M:completion_menu() end
  if opts.formatting ~= false then M:format_on_save() end

end

function M:map(lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(
    self._buffer,
    "n",
    lhs,
    rhs,
    opts or { noremap=true, silent=true }
  )
end

function M:completion_menu()
  vim.api.nvim_buf_set_option(self._buffer, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  -- self:map("<C-space>", "<C-X><C-O>")
end

function M:goto()
  -- function() .... end
  self:map("gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
  self:map("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
  self:map("gr", "<cmd>lua vim.lsp.buf.references()<cr>")
  self:map("gR", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
  self:map("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
  self:map("<Left>", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  self:map("<Right>", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  self:map("<C-p>", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  self:map("<C-n>", "<cmd>lua vim.diagnostic.goto_next()<CR>")
end

function M:rename()
  self:map("<leader>R", "<cmd>lua vim.lsp.buf.rename()<cr>")
end

function M:documentation()
  self:map("<leader>i", "<cmd>lua vim.lsp.buf.hover()<cr>")
end

function M:code_actions()
  self:map("<leader>n", "<cmd>lua vim.diagnostic.open_float()<cr>")
  self:map("<leader>b", "<cmd>lua vim.lsp.buf.code_action()<cr>")
end

function M:format_on_save()
  vim.cmd [[
    augroup Format
      autocmd! * <buffer>
      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
    augroup END
  ]]
end

function M:disable_default_formatting()
  self._client.server_capabilities.document_formatting = false 
  self._client.server_capabilities.document_range_formatting = false
end

return M
