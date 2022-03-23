return function(use)
  -- open with ctrl e
  -- use "mcchrish/nnn.vim"

  use {
    "ms-jpq/chadtree",
    branch = "chad",
    cmd = "CHADopen",
		run = "python3 -m chadtree deps --nvim",
  }

  vim.api.nvim_set_keymap("n", "<c-e>", "<cmd>CHADopen<cr>", {
    noremap = true,
    silent = true
  })
end
