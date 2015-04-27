#!./lua/mac64bit/bin/lua
-- Copyright 2014 Usmar A. Padow (amigojapan) usmpadow@gmail.com
-- BlindOE (the operation environment, should offer something like the bash shell for blind people)
--Load settings
require "settings"
--helper functions
require "BlindOSlib"
if(not advacedMode) then
	speakAndPrint("Weolcome to Blind OS",false)
	speakAndPrint("Type help and press enter for help on how to use the commands",false)
end

quit=false
while quit==false do
	speakAndPrint("Enter command:",false)
	local command_input = io.read()
	if(not advacedMode) then
		speakAndPrint("Command entered: " .. command_input .."",false)
		speakAndPrint("Execute? Y for Yes N for No:",false)
	else
		speakAndPrint(command_input)
		print("Y/N:")
	end
	local answer = string.lower(io.read())
	if(answer=="y") then
		command_line_arr = split_by_space(command_input)
		if(command_line_arr[1]=="say") then
			local phrase=parameters(commands_line_arr,1)
			speakAndPrint(phrase,true)
		elseif(command_line_arr[1]=="run" and command_line_arr[2]=="external") then
			local command_line=parameters(commands_line_arr,2)
			local output = os.capture(command_line,true)
			speakAndPrint(output)
		elseif(command_line_arr[1]=="calculate") then
			formula=parameters(commands_line_arr,1)
			local result = loadstring("return " .. formula)()--eval
			speakAndPrint(formula .. " is equal to " .. result)
		elseif(command_line_arr[1]=="ls" or command_line_arr[1]=="dir") then
			local command_line=parameters(commands_line_arr,0)
			local output = os.capture(command_line,true)
			local enumerated_output = ennumerate_line(output,"File")
			speakAndPrint(enumerated_output)
		elseif(command_line_arr[1]=="date") then
			speakAndPrint(os.date("Today is %B %A the %dth"))
		elseif(command_line_arr[1]=="time") then
			speakAndPrint(os.date("It is %I oclock with %M minutes %p"))
		elseif(command_line_arr[1]=="list" and command_line_arr[2]=="lines") then
			local filename=parameters(commands_line_arr,2)
			os.execute("./line_edutor.lua " .. filename .. " list")	
		elseif(command_line_arr[1]=="edit") then
			local filename=parameters(commands_line_arr,1)
			os.execute("./line_edutor.lua " .. filename)	
		elseif(command_line_arr[1]=="help") then
			speakAndPrint("help for Blind EV, commands follow:")
			speakAndPrint("say phrase, will say a phrase.")
			speakAndPrint("run external command, will run the command you specify on the host operating system. not for interactive programs")
			speakAndPrint("calculate formula, will do the math in the formula tell you the result")
			speakAndPrint("ls, will list the files in the current directory")
			speakAndPrint("date, will say the current date")
			speakAndPrint("time, will say the current time")
			speakAndPrint("list lines X, lists all the lines of file X")
			speakAndPrint("edit X, edits file X")
		elseif(command_input=="quit") then
			speakAndPrint("Goodbye!")
			break
			
		else
			if not advancedMode then
				speakAndPrint("internal command not found, trying external command")
			end
			local command_line=parameters(commands_line_arr,0)
			local output = os.capture(command_line,true)
			speakAndPrint(output)
		end
	end
end
--furq: amigojapan: string.sub(package.config, 1, 1) will give you the directory separator
--if(not file_exists("settingsfile")) then
--	speakAndPrint("Fist time settings")
--end
--local f = assert(io.open("settingsfile", "r"))