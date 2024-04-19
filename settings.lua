--if using espeak enable the following
--pathToSpeachSynth = "/usr/bin/espeak"
--parametersToSpeachSynth="-f"
--package.path=package.path..";/home/amigojapan/projects/ejspeak/?.lua"--add path to ejspeak
--package.preload['/usr/local/share/lua/5.1/readline']
pathToSpeachSynth = "/usr/bin/flite"
parametersToSpeachSynth="-voice ./flite_voices/cmu_us_slt.flitevox -f > /dev/null 2>&1"
safeSpeakFileName="safe_speak.txt"--this prevents shell injection
tmpDir="/home/amigojapan/projects/BlindOS/tmp"--must be full path(must have final slash on mac) but not on linux
advacedMode=false--when advaced mdoe is set to true, it won't say "Y for yes N for no", you just have to know, it will be less verbose in general
speachSynthOn=true--DIsable this if you are going ot use a screen reader instead of espeak
defaultInputType="voice" --"keyboard"
luaProgramsDirectory="/home/amigojapan/projects/BlindOS/luaPrograms" --directory to keep lua programs installed by users
--package.path=package.path..";/usr/local/share/lua/5.1/?.lua"
--package.preload['C-readline']
--os.getenv("PWD") current directory
--example of how to call flite
--/usr/bin/flite -voice ./flite_voices/cmu_us_slt.flitevox -f test.txt
