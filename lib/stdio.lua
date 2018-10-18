require("love.event")
local view = require("lib.fennelview")
local event, channel = ...
local function _0_(...)
  if channel then
    local function _0_()
      io.write("> ")
      io.flush()
      return io.read("*l")
    end
    local prompt = _0_
    local function looper(input)
      if input then
        love.event.push(event, input)
        print(channel:demand())
        return looper(prompt())
      end
    end
    return looper(prompt())
  end
end
_0_(...)
local function start_repl()
  local code = love.filesystem.read("stdio.fnl")
  local function _1_()
    if code then
      return love.filesystem.newFileData(fennel.compileString(code), "io")
    else
      return love.filesystem.read("lib/stdio.lua")
    end
  end
  local lua = _1_()
  local thread = love.thread.newThread(lua)
  local io_channel = love.thread.newChannel()
  thread:start("eval", io_channel)
  local function _2_(input)
    local ok, val = pcall(fennel.eval, input)
    local function _3_()
      if ok then
        return view(val)
      else
        return val
      end
    end
    return io_channel:push(_3_())
  end
  love.handlers.eval = _2_
  return nil
end
return ({start = start_repl})
