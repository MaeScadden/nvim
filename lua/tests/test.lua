local size_of = require "utils/size_of"
local split = require "utils/split"
local iter = require "utils/iter"

local function execute(cmd)
  local handle = io.popen(cmd)
  local result = handle:read("*a")
  handle:close()

  return result
end

local function parse_cmd_output_into_list(output)
  return split(output, "\n")
end

local function path_to_require_path(path)
    return path:sub(path:find("lua")+4, -5)
end

local function run_test_files(files)
  return iter(files)
    .map(function(file_path)
      local path = path_to_require_path(file_path)
      local test_results = require(path)

      if type(test_results) ~= "table" then
        error(string.format(
          "\n[%s]: file did not return a table, did you forget to 'return describe(...'",
          file_path
        ))
      end

      return test_results
    end)
    .reduce(function(results, result)
      results[(file_path .. ':' .. result.name)] = {
        passed = result.passed,
        reason = result.reason,
      }

      return results
    end, {})
end

local function run_tests()
  local output = execute('find ~/.config/nvim/lua -type f -name "*-spec.lua"')
  local files = parse_cmd_output_into_list(output)

  local results = run_test_files(files)

  local passed = {}
  local test_error_results = "\n"

  for path, result in pairs(results) do
    if result.passed ~= true then
      test_error_results = string.format("%s[%s]:\n%s\n", test_error_results, path, result.reason)
    else
      passed[path] = result
    end
  end

  local total_tests = size_of(results)

  if test_error_results == "\n" then
    print(string.format("Success %d/%d (100%%)", total_tests, total_tests))
  else
    local passed_tests = size_of(passed)
    local percent = (passed_tests / total_tests) * 100

    error(string.format("%s\nFailure %d/%d (%.f%%)", test_error_results, passed_tests, total_tests, percent))
  end
end

return run_tests
