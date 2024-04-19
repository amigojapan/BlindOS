#!/usr/bin/lua
-- Copyright 2014 Usmar A. Padow (amigojapan) usmpadow@gmail.com
-- BlindOE (the operation environment, should offer something like the bash shell for blind people)
--Load settings
require "settings"
--helper functions
require "BlindOSlib"
--internationalization dictionary
require "i18n_dict"
--lua file system libeary
lfs = require("lfs")

if defaultInputType=="voice" then
	translate=i18n_setlang("English_voice_input")
else
	translate=i18n_setlang("English_keyboard_input")
end

function help(menutable)
	speakAndPrint("say commands as follows:")
	for index, value in ipairs(menutable) do
		speakAndPrint(value)
	end
end
function sayDateAndTIme()
	speakAndPrint(os.date("Today is %B %A the %dth, the time is %I oclock with %M minutes %p"))
end

function run_program()
	speakAndPrint("say program name:")
	local voice_programName = InputVoiceOrKeyboard()
	print("programs directory:" ..luaProgramsDirectory)
    local fileList = listFilesInDirectory(luaProgramsDirectory)
    programKey=which_menu_item_is_most_simillar(voice_programName,fileList)
    os.execute(luaProgramsDirectory .. "/" ..fileList[programKey])
end

--commands
--so list programs, make folder, delete file, delete folder, list files, edit file, coommand help, quit to linux, I think those are all the menu options I need?
--5:35 PM <amigojapan> change directory
menutable={
	"my dear computer please tell me the system commands",
	"my dear computer please run program",
	"my dear computer please quit BlindOS",
	"my dear computer please tell me the date and time"
}
if(not advacedMode) then
	speakAndPrint("Welcome to Blind Operating Environment",false)
	speakAndPrint(translate["Type 'help for system commands' and press enter for help on how to use the commands"],false)
	--speakAndPrint("日本語モードに変えるには「日本語」ってにゆうりょくしてください。",false)
end

quit=false
while quit==false do
	::start::
	speakAndPrint(translate["Enter command:"],false)
	local command_input = InputVoiceOrKeyboard()
	if command_input==nil or command_input=="" then
		print("error command nil")
        goto start--used this cause there is not continue in lua
	end 
	key,percentage=which_menu_item_is_most_simillar(command_input,menutable) 
	print("actually recognized text:" .. command_input)
	speakAndPrint("I think you said, " .. menutable[key] .." I am ".. math.floor(percentage).." percent sure...",false)
	
	if key == 1 then
		help(menutable)
	elseif key == 2 then
		run_program()
	elseif key == 3 then
		os.exit()
	elseif key == 4 then
		sayDateAndTIme()
	end
	--•amigojapan> yeah I think this needs ot be thought of more deeply
	--7:10 PM <•amigojapan> big-MAC: maybe run the diff first, on the menu items, and then on the list of programs in programs directory woudl be perfect
end
--fix problem with putting quotes inside llama or translate command, maybe need to escape quotes in some special way?