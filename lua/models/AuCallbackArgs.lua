local AuCallbackArgs = {}

function AuCallbackArgs:new(opts)
  self.__index = {}
  self.id = opts.id -- number (autocommand id)
  self.event = opts.event -- string (name of the event that triggered callback)
  self.group = opts.group -- number | nil (the auto command group id, if present)
  self.match = opts.match
  self.buf = opts.buf
  self.file = opts.file
  self.data = opts.data -- literally an any value

  return self
end

return AuCallbackArgs
