local function Use(format)
  if not format == false then
    vim.cmd [[augroup Format]]
    vim.cmd [[autocmd! * <buffer>]]
    vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()]]
    -- vim.cmd [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
    vim.cmd [[augroup END]]
  end
end

return {
  Use = Use
}
