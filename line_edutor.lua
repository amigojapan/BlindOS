#!./lua/mac64bit/bin/lua
-- Copyright 2014 Usmar A. Padow (amigojapan) usmpadow@gmail.com
--Line editor is a text editor for blind people
--Load settings
require "settings"
--helper functions
require "BlindOSlib"
--punctuation lib
require "punctuation"
function ennumerate_lines()
	local output=""
	for counter, line in ipairs(buffer) do
		output = output  .. "Line " .. counter .. " " .. line .. ".\n"
	end
	return output
end
buffer={}
if(not file_exists(arg[1])) then
	speakAndPrint("File does not exist" .. arg[1])
else
	for line in io.lines(arg[1]) do
		table.insert(buffer,table.getn(buffer)+1)
		buffer[table.getn(buffer)]=line--fills the last element with the line from the file
	end
	speakAndPrint("File " .. arg[1] .. " contains " .. table.getn(buffer) .. " lines.")
end

--external call
if arg[2]=="list" then
	local listing=ennumerate_lines()
	speakAndPrint(listing)
	os.exit()
end

if(not advacedMode) then
	speakAndPrint("Weolcome to line editor")
	speakAndPrint("Type help and press enter for help on how to use the commands")
end
--loop
quit=false
while quit==false do
	speakAndPrint("Enter edit command:")
	local command_input = io.read()
--	if(not advacedMode) then
--		speakAndPrint("Command entered: " .. command_input .."")
--		speakAndPrint("Execute? Y for Yes N for No:")
--	else
		command_line_arr = split_by_space(command_input)
		if(command_line_arr[1]=="list") then
			local listing=ennumerate_lines()
			speakAndPrint(listing)
		elseif(command_line_arr[1]=="line" and command_line_arr[2]=="count") then
			speakAndPrint("File contains " .. table.getn(buffer) .. " lines.")
		elseif(command_line_arr[1]=="delete" and command_line_arr[2]=="line") then
			local index = tonumber(command_line_arr[3])
			if(index>table.getn(buffer)) then
				speakAndPrint("The file has only" .. table.getn(buffer) .. " lines " .. " you cannot insert at index " .. index)
			else
				table.remove(buffer, index)
			end
		elseif(command_line_arr[1]=="append" and command_line_arr[2]=="line") then
			table.insert(buffer,table.getn(buffer)+1)
			speakAndPrint("Type contents: ")			
			local new_line = io.read()
			speakAndPrint(new_line)	
			buffer[table.getn(buffer)]=new_line
		elseif(command_line_arr[1]=="insert" and command_line_arr[2]=="line") then
			--this is buggy, it seems to modify the following line after the insert to a number?
			local index = tonumber(command_line_arr[3])
			if(index>table.getn(buffer)) then
				speakAndPrint("The file has only" .. table.getn(buffer) .. " lines " .. " you cannot insert at index " .. index)
			else
				table.insert(buffer, command_line_arr[3])
				speakAndPrint("Type contents: ")			
				local new_line = io.read()
				speakAndPrint(new_line)	
				buffer[index] = new_line
			end 
		elseif(command_line_arr[1]=="edit" and command_line_arr[2]=="line") then
			local index = tonumber(command_line_arr[3])
			if(index>table.getn(buffer)) then
				speakAndPrint("The file has only" .. table.getn(buffer) .. " lines " .. " you cannot edit at index " .. index)
			else
				speakAndPrint("Line used to contain: " .. buffer[index])
				speakAndPrint("Type new contents: ")			
				local new_line = io.read()
				buffer[index] = new_line
			end
		elseif(command_line_arr[1]=="say" and command_line_arr[2]=="line") then
			--print(buffer[index])--this is nil eventhough index is 1, what is up?
			--bug solved , needed to ocnvert to a number print(buffer[1])--this prints, not nil
			local index = tonumber(command_line_arr[3])
			if(index>table.getn(buffer)) then
				speakAndPrint("The file has only" .. table.getn(buffer) .. " lines " .. " you ssked for index " .. index)
			else
				tmp = buffer[index]
				if(command_line_arr[4]=="with" and command_line_arr[5]=="punctuation") then
					if(command_line_arr[6]=="and" and command_line_arr[7]=="spaces") then
						tmp = convert_punctuation_to_words(buffer[index],true)
						print("space")
					else
						tmp = convert_punctuation_to_words(buffer[index],false)
						print("punct")
					end
				end
				speakAndPrint(tmp)				
			end
		elseif(command_line_arr[1]=="save") then
			if(not advacedMode) then
				speakAndPrint("Save File? Y for yes N for no")
			else
				speakAndPrint("Save File?")
				print("Y/N")
			end
			local answer = string.lower(io.read())
			if(answer=="y") then
				file = io.open(arg[1],"w+")
				local data=""
				for counter, line in ipairs(buffer) do
					data = data  .. line .. "\n"
				end
				file:write(data)
				file:close()
				speakAndPrint("File " ..arg[1].." saved.")		
			end													
		elseif(command_line_arr[1]=="help") then
			speakAndPrint("line count, tells you the number of lines in the file")
			speakAndPrint("delete line X, deletes line X")
			speakAndPrint("append line, appends a new line at the end of the file")
			speakAndPrint("insert line X, inserts a new line in line number X")
			speakAndPrint("edit line X, edits line X")
			speakAndPrint("say line X, says the contents of line X")--get rid of this,   why not alway ssay punctuatin?
			speakAndPrint("say line X with punctuation, says the contents of line X with punctuation")
			speakAndPrint("say line X with punctuation ans spaces, says the contents of line X with punctuation and spaces")
			speakAndPrint("save, saves the file")			
		elseif(command_input=="quit") then
			if(not advacedMode) then
				speakAndPrint("Quit editor? Y for yes N for no")
			else
				speakAndPrint("Quit editor?")
				print("Y/N")
			end
			local answer = string.lower(io.read())
			if(answer=="y") then
				speakAndPrint("Leaving editor")
				break
--			end
		end
	end
end