#!/usr/bin/lua
require "settings"
require "BlindOSlib"
--local command_line=arg[1]--parameters(arg,0)
--print("arg[1]:"..arg[1])
arguments=""
if arg[1] ~= nil then
    --print("command_line_arr[2]:" .. command_line_arr[2])
    arguments=arg[1]--parameters(commands_line_arr,1)
end
if arg[2] ~= nil then
    arguments=arguments.." "..arg[2]--parameters(commands_line_arr,1)
end
local output = os.capture("ls "..arguments,true)
local enumerated_output = ennumerate_line(output,"File")
speakAndPrint(enumerated_output)--"Hello World"
