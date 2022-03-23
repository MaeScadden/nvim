vim.g.coq_settings = {
  auto_start = "shut-up",
  keymap = {
    jump_to_mark = "<leader>j",
  },
  clients = {
    buffers = {
      enabled = true,
      weight_adjust = -1.9,
    },
    tree_sitter = {
      enabled = true,
      weight_adjust = -1.5
    },
    lsp = {
      enabled = true,
      weight_adjust = 1.5
    },
    snippets = {
      enabled = true,
      weight_adjust = 1.9
    },
  }
}
