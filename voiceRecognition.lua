local lfs = require("lfs")--lua file system libeary

function LCS(str1, str2)
    local len1 = #str1
    local len2 = #str2
    
    -- Create a 2D array to store the lengths of longest common subsequences
    local dp = {}
    for i = 0, len1 do
        dp[i] = {}
        for j = 0, len2 do
            dp[i][j] = 0
        end
    end
    
    -- Fill the dp array with the lengths of longest common subsequences
    for i = 1, len1 do
        for j = 1, len2 do
            if str1:sub(i, i) == str2:sub(j, j) then
                dp[i][j] = dp[i-1][j-1] + 1
            else
                dp[i][j] = math.max(dp[i-1][j], dp[i][j-1])
            end
        end
    end
    
    -- Traverse the dp array to construct the LCS
    local i = len1
    local j = len2
    local lcs = {}
    while i > 0 and j > 0 do
        if str1:sub(i, i) == str2:sub(j, j) then
            table.insert(lcs, 1, str1:sub(i, i))
            i = i - 1
            j = j - 1
        elseif dp[i-1][j] > dp[i][j-1] then
            i = i - 1
        else
            j = j - 1
        end
    end
    
    return lcs
end

function calculatePercentage(int1, int2)
    if int2 == 0 then
        return "Error: Division by zero"
    end

    local percentage = (int1 / int2) * 100
    return percentage
end

function calculateAverage(numbers)
    local sum = 0
    local count = 0
    
    -- Calculate the sum of numbers and count the total
    for _, number in ipairs(numbers) do
        sum = sum + number
        count = count + 1
    end
    
    -- Calculate the average
    local average = sum / count
    
    return average
end

function percentageEqual(str1,str2)
    lcs = LCS(str1, str2)
    --print("Longest Common Subsequence:", table.concat(lcs))
    PE1 = calculatePercentage(#lcs,#str1)
    --print("string1 is " .. PE1 .."% equal")
    --PE2 = calculatePercentage(#lcs,#str2)
    --print("string2 is " .. PE2 .."% equal")
    local numbers = {tonumber(PE1),tonumber(PE2)}
    diff_percent =calculateAverage(numbers)
    --print("difference of " .. diff_percent.."%")
    return diff_percent
end

function findValueInTable(tbl, value)
    for key, val in pairs(tbl) do
        if val == value then
            return key -- or return true if you just want to know if the value exists
        end
    end
    return false -- return false if the value is not found in the table
end

function getMaxValue(tbl)
    local max_value = nil
    
    for _, value in ipairs(tbl) do
        if max_value == nil or value > max_value then
            max_value = value
        end
    end
    
    return max_value
end

function printTable(tbl)
    for key, value in pairs(tbl) do
        print(key, value)
    end
end

function which_menu_item_is_most_simillar(item,menutable)
    values = {}
    for key, value in pairs(menutable) do
        --print("Key:", key, "Value:", value)
        --print("hey2:" .. item .. value)
        p=percentageEqual(item,value)
        
        --keys = {}

        if p == nil  then
        else
            --print("hey1:" ..item .. p .. value)
            -- Append a new element to the end of the table
            table.insert(values, p)
            --table.insert(keys, key)
        end
    end
    --local maxval=getMaxValue(values)
    --printTable(values)
    maxval=getMaxValue(values)
    --print("maxvalue is:" .. maxval)
    
    key=findValueInTable(values,maxval)
    return key, maxval
end



-- Function to list files in a directory
function listFilesInDirectory(directory)
    local files = {}
    for file in lfs.dir(directory) do
        if file ~= "." and file ~= ".." then
            table.insert(files, file)
        end
    end
    return files
end

--[[
item = "item1"
menutable = {
    "menu item1", 
    "menu item2",
    "menu item3"
}

key=which_menu_item_is_most_simillar(item,menutable)
print(item)
printTable(menutable)
if(key==false) then
    print("value not found in menu")    
else
    print("the most similar item to menu item is item number " .. key)
end
]]--

function voiceRecord()
	os.execute("./voiceRecorder.bash")
end

function voiceRecognize()
	local output = os.capture("./voiceRecognizer.bash",true)
	return output
end

function io.voiceInput()
	print("voice input ready:")
	voiceRecord()
	speakAndPrint("Processing, please wait...")
	text=voiceRecognize()
	text = string.lower(text:sub(1, -2)) --delete the last period
	if text=="yeah" then
		text="yes"
	end
	print("command recongnized as text:" .. text) --echo text
	return text
end