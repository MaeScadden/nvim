return function(path)
  local files = {}
  if path == nil then
    return {}
  end

  local handler = popen('ls -a "'..directory..'"')
  for filename in handler:lines() do
    i = i + 1
    table.append(files, filename)
    t[i] = filename
  end

  handler:close()

  return files
end
