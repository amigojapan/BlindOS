pathToSpeachSynth = "/Users/amigojapan/Desktop/BlindOS/lua/mac64bit/bin/lua /Users/amigojapan/Documents/ejspeak/ejspeak/ejspeak.lua"
parametersToSpeachSynth=""
safeSpeakFileName="safe_speak.txt"--this prevents shell injection
tmpDir="/Users/amigojapan/Desktop/BlindOS/tmp/"--must have final slash
advacedMode=false--when advaced mdoe is set to true, it won't say "Y for yes N for no", you just have to know, it will be less verbose in general
speachSynthOn=true--DIsable this if you are going ot use a screen reader instead of espeak
package.path=package.path..";/Users/amigojapan/Documents/ejspeak/ejspeak/?.lua"--add path to ejspeak
--os.getenv("PWD") current directory
