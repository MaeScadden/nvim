local key_bindings = require "lsp.utils.key_bindings"
local tests = require "plugins.mae.modes.test.use"
local term = require "plugins.mae.term"
local commands = require "lsp.utils.commands"

return {
  on_attach = function(client, bufnr)
    -- client.resolved_capabilities.document_formatting = false 
    -- client.resolved_capabilities.document_range_formatting = false
    client.server_capabilities.document_formatting = false 
    client.server_capabilities.document_range_formatting = false

    key_bindings.Use(client, bufnr)
    commands.Use()

    tests.project(function()
      term("npm run test")
    end)
  end,
  handlers = {
    ["textDocument/definition"] = function(_, result, params)
      if result == nil or vim.tbl_isempty(result) then
        local _ = vim.lsp.log.info() and vim.lsp.log.info(
          params.method,
          'No location found'
        )
        return nil
      end

      if vim.tbl_islist(result) then
        vim.lsp.util.jump_to_location(result[1])

        if #result > 1 then
          local isReactDTs = false

          for key, value in pairs(result) do
            if string.match(value.uri, "react/index.d.ts") then
              isReactDTs = true
			      break
            end
          end
          
          if not isReactDTs then
            vim.lsp.util.set_qflist(util.locations_to_items(result))
            vim.api.nvim_command("copen")
            vim.api.api.nvim_command("wincmd p")
          end
        end
      else
         vim.lsp.util.jump_to_location(result)
      end
    end
  }
}
