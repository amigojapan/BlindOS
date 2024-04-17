#!/bin/bash
#convert voice to text
#whisper rec.ogg --model tiny --language English --task translate --output_format txt -f txt &> /dev/null
vosk-transcriber -i rec.wav -o rec.txt &> /dev/null
#generate output in text
cat rec.txt