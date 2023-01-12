local handler = function()
end

local function set(cb)
  handler = cb
end

local function handle()
  handler()
end

return {
  set = set,
  handle = handle
}
