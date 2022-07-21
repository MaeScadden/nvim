local function use_it(use_name, test_records)
  return function(it_name, test)
      local name = string.format("%s > %s", use_name, it_name)
      local result = test()

      table.insert(test_records, {
        name   = name,
        passed = result == nil,
        reason = result
      })
    end
end

local describe

local function use_describe(root_name, test_records)
  return function(name, tests_callback)
      local inner_root_name = string.format("%s > %s", root_name, name)

      local inner_describe_results = describe(
        inner_root_name,
        tests_callback
      )

      for i = 0, #inner_describe_results do
        table.insert(test_records, inner_describe_results[i])
      end
    end
end

local function create_test_utils(root_name, test_records)
  return {
    it        = use_it(root_name, test_records),
    describe  = use_describe(root_name, test_records),
  }
end

describe = function(name, tests)
  local records = {}
  local utils = create_test_utils(name, records)
  tests(utils)

  return records
end

return describe
