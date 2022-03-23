-- Mappings.
local opts = { noremap=true, silent=true }

local function Use(client, bufnr)
  local function map(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  vim.cmd "filetype plugin indent on"
  -- Enable completion triggered by <c-x><c-o>
  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- GO TO"s
  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  map("n", "K", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)

  map("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  map("n", "<C-i>", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- show information, (show jsdoc info, [var name: type/value]
  -- map('i', '<C-space>', '<C-x><c-o>', opts)
  -- map('i', '<C-k>', '<cmd>lua vim.lsp.buf.completion()<CR>', opts)
  -- map("n", "<A-i>", ":CodeActionMenu<CR>", opts) -- code actions, (remove, import, fix spelling, etc)
  map("n", "<A-I>", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

  map("n", "<A-i>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)

  map("n", "<Left>", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  map("n", "<Right>", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  map("n", ".", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  map("n", ",", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

  -- map("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
  -- map("n", "<leader>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  map("n", "<leader>;", "<cmd>lua require('neogen').generate()<CR>", opts)

  --
  --  TEST
  --
  map("n", "<F4>", ":lua require('dapui').toggle()<CR>", opts)
  map("n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>", opts)
  map("n", "<F9>", ":lua require('dap').continue()<CR>", opts)

  map("n", "<F1>", ":lua require('dap').step_over()<CR>", opts)
  -- map("n", "<F2>", ":lua require('dap').step_into()<CR>", opts)
  map("n", "<F3>", ":lua require('dap').step_out()<CR>", opts)

  map("n", "<Leader>dsc", ":lua require('dap').continue()<CR>", opts)
  map("n", "<Leader>dsv", ":lua require('dap').step_over()<CR>", opts)
  map("n", "<Leader>dsi", ":lua require('dap').step_into()<CR>", opts)
  map("n", "<Leader>dso", ":lua require('dap').step_out()<CR>", opts)

  map("n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>", opts)
  map("v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>", opts)

  map("n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>", opts)
  map("n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", opts)

  map("n", "<Leader>dro", ":lua require('dap').repl.open()<CR>", opts)
  map("n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>", opts)

  map("n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
  map("n", "<Leader>dbm", ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>", opts)
  map("n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>", opts)

  map("n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>", opts)
  map("n", "<Leader>di", ":lua require('dapui').toggle()<CR>", opts)
end

return {
  Use = Use
}
