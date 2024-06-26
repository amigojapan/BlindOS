command_line_arr = split_by_space(command_input)
if(command_line_arr[1]=="say") then
    local phrase=parameters(commands_line_arr,1)
    speakAndPrint(phrase,true)
elseif(command_line_arr[1]=="run" and command_line_arr[2]=="external") then
    local command_line=parameters(commands_line_arr,2)
    local output = os.capture(command_line,true)
    speakAndPrint(output)
elseif(command_line_arr[1]=="llama" and command_line_arr[2]) then
    speakAndPrint("processing...")
    local string=""
    for i = 2, 1000 do
        if command_line_arr[i] == nil then
            break
        end
    
        string = string .. command_line_arr[i] .. " "-- gather all the parameters in one string
    end
    --print(string)
    local command_line='user_input="' .. string  .. '";command="ollama run llama2 \"$user_input\"";eval "$command"'
    --local command_line='user_input="' .. string  .. '";command="echo \"$user_input\"";eval "$command"'
    local output = os.capture(command_line,true)
    speakAndPrint(output)
elseif(command_line_arr[1]=="translate" and command_line_arr[6]) then
    speakAndPrint("processing...")
    local string="tanslate" .. " from " .. command_line_arr[3] .. " to " .. command_line_arr[5] .. " "
    for i = 6, 1000 do
        if command_line_arr[i] == nil then
            break
        end
    
        string = string .. command_line_arr[i] .. " "-- gather all the parameters in one string
    end
    string = string .. ", just give me the phrase, I dont need an explanation"

    --print(string)
    local command_line='user_input="' .. string  .. '";command="ollama run llama2 \"$user_input\"";eval "$command"'
    --local command_line='user_input="' .. string  .. '";command="echo \"$user_input\"";eval "$command"'
    local output = os.capture(command_line,true)
    speakAndPrint(output)		
elseif(command_line_arr[1]=="virc") then
    if(command_line_arr[2]) then
        nick = '"'..command_line_arr[2]..'"'
    else    
        nick ='"'.."voiceIRC" .. math.random(1, 1000)..'"'
    end
    if(command_line_arr[3]) then
        channel = '"'..command_line_arr[3]..'"'
    else    
        channel = '"#BlindOE"'
    end
    os.execute("lua virc.lua " ..nick.." "..channel ,true)
elseif(command_line_arr[1]=="run" and command_line_arr[2]=="lua") then
    local command_line=parameters(commands_line_arr,2)
    os.execute("lua " .. command_line,true)
elseif(command_line_arr[1]=="calculate") then
    formula=parameters(commands_line_arr,1)
    local result = load("return " .. formula)()--eval
    speakAndPrint(formula .. " is equal to " .. result)
elseif(command_line_arr[1]=="ls" or command_line_arr[1]=="dir") then
    local arguments = ""
    if command_line_arr[2] ~= nil then
        --print("command_line_arr[2]:" .. command_line_arr[2])
        arguments='"'..command_line_arr[2]..'"'--parameters(commands_line_arr,1)
    end
    if command_line_arr[3] ~= nil then
        arguments=arguments.." "..command_line_arr[3]--parameters(commands_line_arr,1)
    end
    --print("arguments:" .. arguments)
    os.execute("./ls.lua " .. arguments)
elseif(command_input=="tell me the date and time") then
    
elseif(command_line_arr[1]=="list" and command_line_arr[2]=="lines") then
    local filename=parameters(commands_line_arr,2)
    os.execute("./line_edutor.lua " .. filename .. " list")	
elseif(command_line_arr[1]=="edit") then
    local filename=parameters(commands_line_arr,1)
    os.execute("./line_edutor.lua " .. filename)	
elseif(command_line=="tell me the system commands") then
    speakAndPrint("help for system commands for Blind Operating Environment, commands follow:")
    speakAndPrint("llama parameters, will tell the A.I. to do what you state in the parameters.")
    speakAndPrint("translate from language to language sentence, Provides A.I. translation.")
    speakAndPrint("say phrase, will say a phrase.")
    speakAndPrint("run lua X, will run the lua program X")
    speakAndPrint("run external X, will run the command X on the host operating system. not for interactive programs")
    speakAndPrint("calculate formula, will do the math in the formula tell you the result")
    speakAndPrint("ls, will list the files in the current directory")
    speakAndPrint("tell me the date and time")
    speakAndPrint("list lines X, lists all the lines of file X")
    print("virc [nick] [channel], start voice internet relayed chat")
    speakOnly("V.I.R.C., optional parameters, nick channel, start voice internet relayed chat")
    speakAndPrint("edit X, edits file X")
elseif(command_input=="日本語") then
    translate=i18n_setlang("Japanese")
elseif(command_input=="quit") then
    speakAndPrint("Goodbye!")
    break
else
    if not advancedMode then
        local command_line=parameters(commands_line_arr,0)
        speakAndPrint("internal command not found, try external command by typing, run external" .. command_line )
    end