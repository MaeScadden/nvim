local get_docs_map = require "plugins.mae.api_search.get_docs_map"
local get_docs = require "plugins.mae.api_search.get_docs"
local join = require "utils.join"

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local previewers = require "telescope.previewers"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

vim.api.nvim_set_keymap(
  "n",
  "<leader>u",
  "",
  { callback = function()
    local docs = {}
    for key, value in pairs(get_docs_map()) do
      table.insert(docs, {name = key, info = value})
    end

    opts = opts or {}
    pickers.new(opts, {
      prompt_title = "nvim_api",
      finder = finders.new_table({
        results = docs,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry.name,
            ordinal = entry.name,
          }
        end,
      }),
      previewer = previewers.new_buffer_previewer({
        define_preview = function(self, entry, status)
          vim.api.nvim_buf_set_lines(self.state.bufnr, 0, -1, false, entry.value.info)
        end 
      }),
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          vim.cmd((":h %s"):format(selection.value.name))
          -- vim.api.nvim_put({ selection[1] }, "", false, true)
        end)
        return true
      end,
    }):find()
  end}
)
