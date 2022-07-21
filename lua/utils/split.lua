local function split(str,sep)
  return {
    str:match((str:gsub("[^"..sep.."]*"..sep, "([^"..sep.."]*)"..sep)))
  }
end

return split
