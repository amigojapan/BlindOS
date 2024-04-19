# Blind Operating Enviroment

Copyright 2014 Usmar A. Padow (amigojapan) usmpadow@gmail.com

please bare with the voice for first video, the voice improves after in the second video:

<a href="https://youtu.be/IN-rEne0eFM?si=rzq6De4hgqESFxUM" target="_blank"><img src="https://raw.githubusercontent.com/amigojapan/BlindOS/master/youtube%20play%20button.jpg" 
alt="video demo of ejspeak" width="100" height="80" border="10" /></a>

second video, better voice and demonstrates how you program in BlindOE

<a href="https://www.youtube.com/embed/vW1Cn8gW_lg?si=6m35OMOxK82AuMy4" target="_blank"><img src="https://raw.githubusercontent.com/amigojapan/BlindOS/master/youtube%20play%20button.jpg" 
alt="video demo of ejspeak" width="100" height="80" border="10" /></a>

video showing voice internlay replay chat

<a href="https://youtu.be/rGwiFR_mmeE?si=2kaXZItXhLhJqt-F" target="_blank"><img src="https://raw.githubusercontent.com/amigojapan/BlindOS/master/youtube%20play%20button.jpg" 
alt="video demo of ejspeak" width="100" height="80" border="10" /></a>

ollama ai now available with BlindOE

<a href="https://youtu.be/fAdPHP0iniM?si=RTcXXJbzPhERtpEL" target="_blank"><img src="https://raw.githubusercontent.com/amigojapan/BlindOS/master/youtube%20play%20button.jpg" 
alt="video demo of ejspeak" width="100" height="80" border="10" /></a>



BlindOS is an Operating Environment System designed specifically for the blind:
the goals of this project are:
-to make a multi-platform system(Windows, Mac, or Linux) that is easy to use for blind people to use their computers withought needing to learn brile
-to enable computer programming for blind people.
-This project also has a second focus which is making itself reprogrammable by blind people, and allowing to make new applications for it by blind people 

Programs: (in order of importance)
 BlindOE (the operation environment, similar to bash) 
 -this program helps people manage their files and start programs
 
 -line_edutor.lua (offers an easy line editor, the reason for a line editor is so that the whole document does not need to be synthesized into speech just to correct one mistake, this tool can be used for programming too,simple version could just have a shortcut for repeating the previous line, and a way to retype it. 

 -voice internet relay chat

<!---
on windows:(I am still having touble running it on windows, but i am determined ot get it wokring on windows)

install wsl2

install a linux distro from microsoft store, insttuctions for ubuntu are given here

install pulse audio for windows

https://x410.dev/cookbook/wsl/enabling-sound-in-wsl-ubuntu-let-it-sing/


open ubuntu

type:

sudo apt-get install pulseaudio

you will need to type this each time, you may want to put it in .bashrc

pulseaudio

export PULSE_SERVER=127.0.0.1;
 --->
for windows:
first download and install virtual box from  [here](https://download.virtualbox.org/virtualbox/7.0.12/VirtualBox-7.0.12-159484-Win.exe)

download debian 12 Bookworm amd64 from  [here](https://cdimage.debian.org/debian-cd/current/amd64/iso-cd/debian-12.4.0-amd64-netinst.iso)

install debian 12 Bookworm on virtual box untested instructions can be found [here](https://www.makeuseof.com/how-to-install-debian-on-virtualbox/
)

install Guest Additions for linux, untested instructions can be found [here](https://wiki.debian.org/VirtualBox#Installing_the_Guest_Additions_on_a_Debian_VM)

then follow the following insturctions for linux:

on linux:(developed and tested on Linux mint and debian 12 bookworm)

on mint preciede every apt-get with sudo

on debian open a termianl and do

su

enter your root password you set during debian installation

apt-get update

apt-get install git

apt-get install flite

apt-get install lua5.3

apt-get install liblua5.3-dev

apt-get install luarocks

luarocks install luasocket

luarocks install luafilesystem

apt-get install lua-posix

curl https://ollama.ai/install.sh | sh

ollama run llama2

/bye

(on debian only) type exit

clone this repo

git clone https://github.com/amigojapan/BlindOS

cd BlindOS

edit tmpDir="/home/amigojapan/projects/BlindOS/tmp" in settings.lua. it must be a full absolute path to BlindOS/tmp

./BlindOE.lua

once you have been able ot execute it this way, you will want to do the following back in bash

chmod +x ./runBlindOE.py

and run it like this

pip3 install vosk

vosk-transcriber -i rec.wav -o rec.txt

./runBlindOE.py





—up to here most things have been implemented

To do:

0). need to add a feture to editor to move chuncks of code aroudn in a file, like move lines form line 20 to line 30 to line 15

1). Blind Menu (a kind of desktop for those who prefer to use a menu rather than commands, works kind of like a menu on the telephone)

2). BlindWEB (A web client that accesses a group of webpages designed  specifically for the blind), this will also allow people to host their own applications made for BlindOS on the web 

3). Blind Mail Client

4). Blind Music Player

5). Blind App Downloader(package manager)

Other applications for the blind are welcome and will be added to BlindOS

known bugs:

FIXED-virc quits qith Excess Flood after flooding PONG for some reason

running as ./runBlindOE.py sometimes ends up with an eternal loop of just entering and quitting from BlindOE

# Join me in irc.libera.chat in channel #BlindOE
