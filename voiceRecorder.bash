#!/bin/bash
touch rec.wav
#(rec is conteined in package sox) record until start voice, then end when end talking with 1% mirofopne noise tolerance
rec rec.wav rate 64k silence 1 0.1 1% 1 3.0 1% &> /dev/null 