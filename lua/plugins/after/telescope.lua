require("telescope").setup{
 defaults = {
  vimgrep_arguments = {
    "rg",
    "--color=never",
    "--no-heading",
    "--with-filename",
    "--line-number",
    "--column",
    "--smart-case",
  },
  -- prompt_prefix = "   ",
  -- selection_caret = "  ",
  -- entry_prefix = "  ",
  initial_mode = "insert",
  selection_strategy = "reset",
  sorting_strategy = "descending",
  layout_strategy = "horizontal",
  layout_config = {
    horizontal = {
      prompt_position = "bottom",
      preview_width = 0.55,
      results_width = 0.8,
    },
    vertical = {
      mirror = false,
    },
    width = 0.87,
    height = 0.80,
    preview_cutoff = 120,
  },
  -- file_sorter = require("telescope.sorters").get_fuzzy_file,
  file_ignore_patterns = { "node_modules", ".git" },
  set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
 },
}

vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files find_command=rg,--hidden,--files,--ignore<cr>', {})
vim.api.nvim_set_keymap('n', '<C-r>', '<cmd>lua require(\'telescope.builtin\').live_grep()<cr>', {})
