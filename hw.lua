#!/usr/bin/lua
require "settings"
require "BlindOSlib"
while true do
    speakAndPrint("Hello World! q to quit enter to continue")
    local userInput = io.read()
    if userInput == "q" then
        os.exit()
    end
end
