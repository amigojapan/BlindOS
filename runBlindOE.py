#!/usr/bin/python3
import signal # Import signal module
import time
import subprocess

#signal handler function
def SignalHandler_SIGINT(SignalNumber,Frame):
    print('Ctrl + C was pressed, cannot quit with Ctrl + C')
    
#register the signal with Signal handler
signal.signal(signal.SIGINT,SignalHandler_SIGINT)

#infinite signal from which we have to escape
while 1: 
    subprocess.run(['./BlindOE.lua'])
    ##input("press enter to continue") 