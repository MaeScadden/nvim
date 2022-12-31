local LspManager = require "lsp.LspManager"
local once = require "utils.once"

local function handle_to_definition_for_react(_, results, params)
  local results_are_empty = results == nil or vim.tbl_isempty(results)

  if results_are_empty then
    local _ = vim.lsp.log.info() and vim.lsp.log.info(
      params.method,
      'No location found'
    )

    return nil
  end

  local results_are_a_list = vim.tbl_islist(results)

  if results_are_a_list then
    vim.lsp.util.jump_to_location(results[1])

    if #results > 1 then
      local isReactDTs = once(function(result, _)
          return string.match(value.uri, "react/index.d.ts")
        end)(results)

      if not isReactDTs then
        vim.lsp.util.set_qflist(util.locations_to_items(results))
        vim.api.nvim_command("copen")
        vim.api.nvim_command("wincmd p")
      end
    end
  else
    vim.lsp.util.jump_to_location(results)
  end
end

return {
  on_attach = function(client, bufnr)
    local manager = LspManager:new(client, bufnr)
    manager:setup({ formatting = false })
    manager:disable_default_formatting()
  end,
  handlers = {
    ["textDocument/definition"] = handle_to_definition_for_react
  }
}
