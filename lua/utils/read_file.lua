return function(path, resolve, reject)
  vim.fn.jobstart({ "cat", path }, {
    stdout_buffered = true,
    on_stdout = function(hello, output)
      if output then
        if resolve ~= nil then
          resolve(output)
        end
      else
        if reject ~= nil then
          reject("stdout data is falsy", {_, output})
        end
      end
    end
  })
end
