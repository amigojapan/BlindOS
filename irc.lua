--global posix = require("posix")
socket = require("socket")

-- Set buffering mode to 'no' for non-blocking input
io.stdin:setvbuf("no")
local ev = require "ev"

function nonBlockingInput(callback)
    local stdin_watcher = ev.IO.new(function()
        local input = io.stdin:read("*l")
        callback(input)
    end, 0, ev.READ)

    stdin_watcher:start(ev.Loop.default)
end

-- Example usage
nonBlockingInput(function(userInput)
    if userInput then
        print("User input:", userInput)
    else
        print("No input within the timeout.")
    end
    ev.Loop.default:unloop()
end)

ev.Loop.default:loop()

client = socket.tcp()
client:connect("irc.libera.chat", 6667)
client:settimeout(0)

user_input = ""
print("waiting 15 seconds for connect...\r\n server: irc.libera.chat channel: ##anime")
socket.sleep(15) -- wait enough till logon

line = "nick shortestLuaIRC" .. math.random(1, 100) .. "\r\nuser a a a a\r\n"
print(line .. " nick and user ***")
client:send(line)

socket.sleep(2)

line = "join ##anime\r\n"
print(line .. " joining channel ***")
client:send(line)

socket.sleep(2)

-- ... (previous code)

buff = ""
while true do
    buff, err = client:receive(4096)
    if buff then
        io.write(buff)
        io.flush()
    end

    if buff and buff:find("^PING") then
        local s = buff:sub(5)
        line = "PONG\r\n"
        print("pong reached", line)
        client:send(line)

        socket.sleep(2)
    end

    if not buff and err == "timeout" then
        -- No data available from the socket, handle input
        socket.sleep(0.05) -- 50ms delay (20 checks per second)
        local key = any_key()
        if key then
            -- Handle user input here
            if key == '\x7f' then
                -- Backspace pressed
                user_input = user_input:sub(1, -2)
                print("")
                print(user_input)
            elseif key == '\n' then
                -- Enter pressed
                line = "privmsg ##anime : " .. user_input .. "\r\n"
                client:send(line)
                print("sending:", line)

                socket.sleep(2)
                user_input = ""
                print("")
            else
                -- Alphanumeric key pressed
                user_input = user_input .. key
                io.write(key)
                io.flush()
            end
        end
    elseif not buff then
        -- A "real" error occurred
        print(err)
        os.exit(1)
    end
end
