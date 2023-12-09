#!/usr/bin/lua
-- Copyright 2014 Usmar A. Padow (amigojapan) usmpadow@gmail.com
--browser is a web browser for blind people
--Load settings
--require "settings"
--helper functions
--require "BlindOSlib"
--punctuation lib
--require "punctuation"
http = require("socket.http")
body =  http.request("http://localhost:8000/test.html")
doc={}
elements={}
function textToTag(html,tag)
	local startpos, endpos =string.find(html,tag)
	if startpos==nil then
		return nil
	end
	local string=string.sub(body,1,startpos-1)
	return string, endpos+1
end
--repeat until the document has been completely parsed
--eliminate every tag that is not a link: do later
finished=false
--convert all document to lower case
body=string.lower(body)
--eliminate newlines
body = string.gsub(body,"\n","")
--erase body tag
local startpos, endpos =string.find(body,"<body>")
if startpos == nil then--no more hyperlinks left
	print("error, no body tag found")
	finished=true
end	
body=string.sub(body,endpos+1,string.len(body))

while not finished do
	--find hyperlink
	--get all text until <a href=
	--do later, accept quotes arounf the url
	local text, endpos=textToTag(body,"<a href=")
	--print(text)
	if text == nil then--no more hyperlinks left
		finished=true
		break
	end	
	elements[text]="text"
	table.insert(doc,table.getn(doc)+1)--insert new element to document
	doc[table.getn(doc)]=text	

	body=string.sub(body,endpos,string.len(body))
	--print(body)
	-- append to text to hash table, with no url
	--get url, ending at >    note, this method is very specific for what tags are acceptable
	local url, endpos=textToTag(body,">")
	--print(url)
	if url == nil then--no close of hyperlink
		break
	end
	body=string.sub(body,endpos,string.len(body))
	--get link text until </a>
	local key, endpos=textToTag(body,"</a>")
	--print(key)
	if key == nil then--no close of a tag
		break
	end
	body=string.sub(body,endpos,string.len(body))	--save as url
	elements[key]=url
	table.insert(doc,table.getn(doc)+1)--insert new element to document
	doc[table.getn(doc)]=key		
end
for elemkey, elemval in pairs(elements) do
		print("key:" .. elemkey .. " val:" .. elemval)
end
--for key, val in pairs(doc) do
--	for elemkey, elemval in pairs(elements) do
--		if elemval== elements[val] then
--			print("key:" .. elemkey)
--			break
--		end
--	end
--	print("val:" .. elements[val])
--end