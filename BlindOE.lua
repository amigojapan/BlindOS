#!/usr/bin/lua
-- Copyright 2014 Usmar A. Padow (amigojapan) usmpadow@gmail.com
-- BlindOE (the operation environment, should offer something like the bash shell for blind people)
--Load settings
require "settings"
--helper functions
require "BlindOSlib"
--internationalization dictionary
require "i18n_dict"
if defaultInputType=="voice" then
	translate=i18n_setlang("English_voice_input")
else
	translate=i18n_setlang("English_keyboard_input")
end

function help()
	speakAndPrint("help for system commands for Blind Operating Environment, commands follow:")
	speakAndPrint("my dear computer please tell me the system commands")
	speakAndPrint("my dear computer please tell me the date and time")
	speakAndPrint("llama parameters, will tell the A.I. to do what you state in the parameters.")
	speakAndPrint("translate from language to language sentence, Provides A.I. translation.")
	speakAndPrint("say phrase, will say a phrase.")
	speakAndPrint("run lua X, will run the lua program X")
	speakAndPrint("run external X, will run the command X on the host operating system. not for interactive programs")
	speakAndPrint("calculate formula, will do the math in the formula tell you the result")
	speakAndPrint("ls, will list the files in the current directory")
	speakAndPrint("list lines X, lists all the lines of file X")
	print("virc [nick] [channel], start voice internet relayed chat")
	speakOnly("V.I.R.C., optional parameters, nick channel, start voice internet relayed chat")
	speakAndPrint("edit X, edits file X")
end
function sayDateAndTIme()
	speakAndPrint(os.date("Today is %B %A the %dth, the time is %I oclock with %M minutes %p"))
end

menutable={
	"my dear computer please tell me the system commands",
	"my dear computer please tell me the date and time"
}
if(not advacedMode) then
	speakAndPrint("Welcome to Blind Operating Environment",false)
	speakAndPrint(translate["Type 'help for system commands' and press enter for help on how to use the commands"],false)
	--speakAndPrint("日本語モードに変えるには「日本語」ってにゆうりょくしてください。",false)
end

quit=false
while quit==false do
	speakAndPrint(translate["Enter command:"],false)
	local command_input = InputVoiceOrKeyboard()
	if(not advacedMode) then
		if command_input==nil  then
			print("error command nil")
			break
		end 
		key=which_menu_item_is_most_simillar(command_input,menutable) 
		speakAndPrint("Command entered, " .. command_input .."",false)
		speakAndPrint("Execute? Y for Yes N for No:",false)
	else
		speakAndPrint(command_input)
		print("Yes/No:")
	end
	local answer = string.lower(InputVoiceOrKeyboard(override))
	if(answer=="yes") then
		if key == 1 then
			help()
		else if key == 2 then
			sayDateAndTIme()
		end

		end
	end
end
--fix problem with putting quotes inside llama or translate command, maybe need to escape quotes in some special way?