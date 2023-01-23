local function buf_map(lhs, rhs, callback)
  vim.api.nvim_buf_set_keymap(0, "n", lhs, rhs, { callback = callback, noremap = true })
end

vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  -- group = vim.api.nvim_create_augroup("QF"),
  callback = function()
    buf_map("dd", "", function()
      vim.cmd [[
        let curqfidx = line('.') - 1
        let qfall = getqflist()
        call remove(qfall, curqfidx)
        call setqflist(qfall, 'r')
        execute curqfidx + 1 . "cfirst"
        :copen
      ]]
    end)
  end
})


vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  -- group = vim.api.nvim_create_augroup("NetrwFileType"),
  callback = function()
    buf_map("<C-h>", "<C-w>h")
    buf_map("<C-l>", "<C-w>l")
    buf_map("<C-j>", "<C-w>j")
    buf_map("<C-k>", "<C-w>k")
    buf_map("x", "", function()
      local root = vim.fn.expand("%:p:h")
      local path = root .. "/" .. vim.api.nvim_get_current_line()
      vim.fn.delete(path, "rf")
      vim.cmd(":Ex " .. root)
    end)
  end
})
