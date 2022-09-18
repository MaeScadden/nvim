local read_file = require "utils.read_file"
local starts = require "utils.starts"
local slice_str_until = require "utils.slice_str_until"

local api_map = {}
local api_txt_file_path = (("%s/%s"):format(os.getenv("VIMRUNTIME"), "doc/api.txt"))

local function setup()
  read_file(
    api_txt_file_path,
    function(lines)
      local current_cmd = nil

      for _, line in pairs(lines) do
        if #line == 0 or string.find(line, "^[% \t\n]") ~= nil then
          if current_cmd then
            table.insert(api_map[current_cmd], line)
          end
        else
          if starts(line, "nvim_") then
            local index_of_end_of_cmd_name = (string.find(line, "[%[( \n]"))
            current_cmd = string.sub(line, 1, index_of_end_of_cmd_name - 1)

            if current_cmd == nil or current_cmd == line then
              error(line)
            end

            api_map[current_cmd] = {line}
          else
            -- print(("leaving command for: [%s]`%s`"):format(#line, line))
            current_cmd = nil
          end
        end
      end
    end,
    function(e)
      error(e)
    end
  )
end


setup()
return function()
  return api_map
end
