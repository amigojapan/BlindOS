-- load namespace
local socket = require("socket")
local server = socket.tcp()
server:bind('*',5002) -- bind on port 5000
server:listen(32)
server:settimeout(0.01)--make it non blocking, making this value smaller makes it faster, but probably mroe CPU load, and 0 does not work(i think)

-- find out which port the OS chose for us
local ip, port = server:getsockname()
-- print a message informing what's up
print("Please connect to localhost on port " .. port)
print (ip)

clients = {}
while 1 do
	local c,s  = server:accept()
	--print(s)
	if s == nil then -- not timeout
		table.insert(clients, c)
		c:settimeout(0)
		print("client connected...")
	end
	for key,client in pairs(clients) do
		-- receive the line
		local line, err = client:receive()
		if not err then print (key .. ":" .. line) end
		-- if there was no error, send it back to the client
		if not err then client:send(line .. "\n") end
	end	
end
