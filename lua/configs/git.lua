return {
  {
    "https://github.com/tpope/vim-fugitive",
    config = function()
      local function branches()
        local output = require("utils.execute")(":!git branch --all")
        local lines = vim.list_slice(output, 3, #output)

        return vim.tbl_map(function(str)
          return string.sub(str, 3)
        end, lines)
      end

      vim.api.nvim_create_user_command("Gshow", function(arg)
        local branch = arg[1]

        if branch == nil then
          branch = branches()[1]
          if branch == nil then
            error("No Branch found")
          end
        end

        vim.cmd(string.format(":Gedit %s:%%", branch))
      end, {})

      vim.api.nvim_create_user_command("GBranches", function()
        vim.cmd(":split")
        local buf = vim.api.nvim_create_buf(false, true)
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, branches())
        vim.api.nvim_set_current_buf(buf)
      end, {})
    end,
    lazy = false,
  },
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
    init = function()
      vim.keymap.set(
        "n",
        "<leader>v",
        function()
          require("gitsigns").blame_line()
          --  :Gitsigns blame_line
        end
      )
    end
  },
}
