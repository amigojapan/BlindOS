#!./lua/mac64bit/bin/lua
safeSpeakFileName="safe_speak.txt"--this prevents shell injection
tmpDir="/Users/amigojapan/Desktop/BlindOS/tmp"
file = assert(io.open(tmpDir.."/"..safeSpeakFileName,"w"))
--file = assert(io.open("./tmp/t.txt","w+"))
file:write("hello")
file:close()