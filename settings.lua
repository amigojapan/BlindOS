--pathToSpeachSynth = "/usr/bin/espeak"
--parametersToSpeachSynth="-f"
pathToSpeachSynth = "/usr/bin/flite"
parametersToSpeachSynth="-voice ./flite_voices/cmu_us_slt.flitevox -f"
safeSpeakFileName="safe_speak.txt"--this prevents shell injection
tmpDir="/home/amigojapan/projects/BlindOS/tmp"--(must have final slash on mac) but not on linux
advacedMode=false--when advaced mdoe is set to true, it won't say "Y for yes N for no", you just have to know, it will be less verbose in general
speachSynthOn=true--DIsable this if you are going ot use a screen reader instead of espeak
package.path=package.path..";/home/amigojapan/projects/ejspeak/?.lua"--add path to ejspeak
--os.getenv("PWD") current directory
