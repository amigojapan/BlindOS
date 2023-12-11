require "settings"
--helper functions
require "BlindOSlib"
--punctuation lib
require "punctuation"

require "inkeylua"
require "helperFunctions"
--speakAndPrint("Welcome to voice internet relayed chat, press control plus C to quit")
socket = require("socket")

math.randomseed(os.time())
--print("arg[1]:"..arg[1])
--print("arg[2]:"..arg[2])
if(arg[1]) then
    nick = arg[1]
else    
    nick ="voiceIRC" .. math.random(1, 1000)
end
if(arg[2]) then
    channel = arg[2]
else    
    channel = "##BlindOE"
end

server = "irc.libera.chat"

client = socket.tcp()
client:connect(server, 6667)
client:settimeout(0)

user_input = ""
speakAndPrint("waiting 15 seconds for connect...\r\n server, " .. server .. " channel, " .. channel .. "")
socket.sleep(15) -- wait enough till logon

line = "nick ".. nick .. "\r\nuser a a a a\r\n"
--os.exit()
speakAndPrint(line .. " nick and user ***")
client:send(line)

socket.sleep(2)

line = "join " .. channel .. "\r\n"
speakAndPrint(line .. " joining channel ***")
client:send(line)

socket.sleep(2)

buff = ""
buffbuff=""
while true do
    buff, err = client:receive(1)
    --if buff and buff:find("^PING") then
    --    local s = buff:sub(5)
    --    line = "PONG\r\n"
    --    print("pong reached", line)
    --    client:send(line)
        

    --    socket.sleep(2)
    --end
    local str=""
    if buff then
        buffbuff=buffbuff..buff
        str =string.sub(buff,#buff, #buff)
    end
    
    if str == "\n" then
        local before,after=getBeforeAndAfterSTring(buffbuff,"PRIVMSG")
        if before then
            local friendnick=findLastNick(buffbuff)
            --local friendnick,after=getBeforeAndAfterSTring(buffbuff,"!")
            if friendnick then
                --local friendnick = string.sub(friendnick,2, #friendnick)
                local _,message=getBeforeAndAfterSTring(buffbuff,channel.." :")
                if message then
                    local message=findLastMessage(buffbuff,channel)
                    speakAndPrint("message from:"..friendnick..","..message)
                    buffbuff=""
                end 
            end
        end
        --io.write(buff)
        -- Check for PING message
        local ping_message = buffbuff:match("^PING :(.+)")
        if ping_message then
            print("PING received, responding with PONG")
            line = "PONG :" .. ping_message .. "\r\n"
            client:send(line)
            socket.sleep(2)
        end

 
    end


    if not buff and err == "timeout" then
        -- No data available from the socket, handle input
        socket.sleep(0.05) -- 50ms delay (20 checks per second)
        local key = inkey()
        if key then
            -- Handle user input here
            if key == '\x7f' then
                -- Backspace pressed
                user_input = user_input:sub(1, -2)
                print("")
                print(user_input)
            elseif key == '\n' then
                -- Enter pressed
                line = "privmsg " .. channel .. " : " .. user_input .. "\r\n"
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
