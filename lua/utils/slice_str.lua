return function(start_i, end_i)
  return function(str)
    local end_index = end_i or #str
    local start_index = start_i or 0

    return strings.strsub(str, start_index, end_index)
  end
end
