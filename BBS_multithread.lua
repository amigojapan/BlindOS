-- load namespace
local socket = require("socket")
local server = socket.tcp()
server:bind('*',5000) -- bind on port 5000
server:listen(32)
-- find out which port the OS chose for us
local ip, port = server:getsockname()
-- print a message informing what's up
print("Please connect to localhost on port " .. port)
print (ip)

function BBS(server)
	-- loop forever waiting for clients
	while 1 do
		-- wait for a connection from any client
		local c = server:accept()
		-- make sure we don't block waiting for this client's line
		--client:settimeout(5)
		while 1 do
			
			-- receive the line
			local line, err = client:receive()
			if not err then print (line) end
			-- if there was no error, send it back to the client
			if not err then client:send(line .. "\n") end
		end
		-- done with client, close the object
		--client:close()
	end
end