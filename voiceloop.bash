#!/bin/bash
touch rec.ogg
while true
do
    # loop infinitely
    echo "say something now:"
    #(rec is conteined in package sox) record until start voice, then end when end talking with 1% mirofopne noise tolerance
    rec rec.wav rate 64k silence 1 0.1 1% 1 3.0 1% &> /dev/null 
    echo "processing..."
    #convert voice to text
    #whisper rec.ogg --model tiny --language English --task translate --output_format txt -f txt &> /dev/null
    vosk-transcriber -i rec.wav -o rec.txt &> /dev/null
    echo "output:"
    cat rec.txt
    read -p "Press any key to resume ..."
done
