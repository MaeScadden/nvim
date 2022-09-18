local get_docs_map = require "plugins.mae.api_search.get_docs_map"

return function(api_cmd_name)
  return get_docs_map()[api_cmd_name]
end
