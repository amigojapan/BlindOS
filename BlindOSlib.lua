require("punctuation")
require("settings")
require("voiceRecognition")
--readline = require("readline")
--function voiceRecord()
--	--os.execute(voiceRecorder)
--	os.execute([[sh -c "rec rec.ogg rate 8k silence 1 0.1 3% 1 3.0 3% 2"]])
--	--io.popen(voiceRecorder):close()
--end
function file_exists(file)
	local f = io.open(file, "rb")
	if f then f:close() end
	return f ~= nil
end

-- get all lines from a file, returns an empty 
-- list/table if the file does not exist
function lines_from(file)
	if not file_exists(file) then return {} end
	local lines = {}
	for line in io.lines(file) do 
		lines[#lines + 1] = line
	end
	return lines
	end
function os.capture(cmd, raw)
	local f = assert(io.popen(cmd, 'r'))
	local s = assert(f:read('*a'))
	f:close()
	if raw then return s end
	s = string.gsub(s, '^%s+', '')
	s = string.gsub(s, '%s+$', '')
	s = string.gsub(s, '[\n\r]+', ' ')
	return s
end

function InputVoiceOrKeyboard(override)
	if override ~= nil then --specify what input method to use
		if override == "voice" then
			return io.voiceInput()
		else -- use keyboard input
			return io.read()
		end
	end
	if defaultInputType == "voice" then
		return io.voiceInput()
	else -- use keyboard input
		return io.read()
	end
end
function speakAndPrint(output,sayPunctuation,spaces,language)
	--ssayPunctuation = sayPunctuation == nil and true or sayPunctuation
	--spaces = spaces == nil and false or spaces
	if sayPunctuation == nil then sayPunctuation = true end
	if spaces == nil then spaces = false end
	--print(sayPunctuation)
	print(output)
	if not speachSynthOn then
		return
	end 
	local tmp = convert_punctuation_to_words(output,sayPunctuation,spaces)
	--if language == "japanese"
	--unsafe for shell injection os.execute(pathToSpeachSynth .. " " .. parametersToSpeachSynth ..  " \"" .. tmp .."\"")
	--writing to a file to prevent shell injection
	--***this may need tweeks for windows cause of the unix slashes
	file = assert(io.open(tmpDir.."/"..safeSpeakFileName,"w+"))
	file:write(output)
	file:close()
	command=pathToSpeachSynth .. " " .. parametersToSpeachSynth .. " " .. tmpDir.."/"..safeSpeakFileName .. ">/dev/null"
	--print(command)
	os.execute(command)
end
function gnureadline()
	while true do
		-- Read a line using GNU Readline
--		local line = readline.readline(prompt)
	
		-- Check for EOF (Ctrl+D)
		if line == nil then
			print("\nExiting.")
			return ""--break
		end
	
		-- Print the input
		print("You entered:", line)
		l=line
		-- Free the allocated memory for the line
--		readline.free(line)
		return l
	end
end	
function speakOnly(output,sayPunctuation,spaces,language)
	--ssayPunctuation = sayPunctuation == nil and true or sayPunctuation
	--spaces = spaces == nil and false or spaces
	if sayPunctuation == nil then sayPunctuation = true end
	if spaces == nil then spaces = false end
	--print(sayPunctuation)
	--print(output)
	if not speachSynthOn then
		return
	end 
	local tmp = convert_punctuation_to_words(output,sayPunctuation,spaces)
	--if language == "japanese"
	--unsafe for shell injection os.execute(pathToSpeachSynth .. " " .. parametersToSpeachSynth ..  " \"" .. tmp .."\"")
	--writing to a file to prevent shell injection
	--***this may need tweeks for windows cause of the unix slashes
	file = assert(io.open(tmpDir.."/"..safeSpeakFileName,"w+"))
	file:write(output)
	file:close()
	command=pathToSpeachSynth .. " " .. parametersToSpeachSynth .. " " .. tmpDir.."/"..safeSpeakFileName .. ">/dev/null"
	--print(command)
	os.execute(command)
end
function split_by_space(str)
	local arr = {}
	local index=1
	for i in string.gmatch(str, "%S+") do
		arr[index]=i
		index=index+1
	end
	return arr
end
function split_by_newline(str)
	--local local index=1;for i in string.gmatch("test\nthis\nstring", "[^\r\n]+") do print(i);index=index+1; end -- works on both Linux and Windows
	local arr = {}
	local index=1
	for i in string.gmatch(str, "[^\r\n]+") do
		arr[index]=i
		index=index+1
	end
	return arr
end
  
function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil then io.close(f) return true else return false end
end
function parameters(commands_line_arr,command_length)
	local params=""
	--print ("command_line_arr:" .. command_line_arr)
	for i, word in ipairs(command_line_arr) do
		if(i>command_length) then 
			params = params .. " " .. word
		end
	end
	return params
end
function ennumerate_line(str,kind_of_line)
	local str_arr = split_by_newline(str)
	local output=""
	for i, word in ipairs(str_arr) do
		output = output .. kind_of_line .. " " .. i .. " " .. " " .. word .. ".\n"
	end
	return output
end