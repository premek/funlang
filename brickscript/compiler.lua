local parser = require(arg[0]:match("(.-)[^/\\]+$")..'parser')


local function read(file) -- TODO should this be here or in client code? At lease allow to pass an ink content in a string
  if love and love.filesystem and love.filesystem.read then
    local content, size = love.filesystem.read(file)
    return content
  else
    local f = io.open(file, "rb")
    if not f then error('failed to open "'..file..'"') end
    local content = f:read("*all")
    f:close()
    return content
  end
end


local function dump ( t ) -- tables only (array-like only)
    local function sub_print_r(t)
            if (type(t)=="table") then
                local b = ""
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        b = b .. "{"..sub_print_r(val).."},"
                    elseif (type(val)=="string") then
                        b = b .. '"'..string.gsub(val,'"', '\\"')..'",'
                    else
                        b = b .. tostring(val) .. ', '
                    end
                end
                return b
            else
                return tostring(t)
            end
    end
    return "-- This file was generated by brick-script - do not edit\nreturn {" .. sub_print_r(t) .. "}"
end

print(dump(parser:match(read(arg[1]))))
