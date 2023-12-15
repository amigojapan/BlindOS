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

on windows:(I am still having touble running it on windows, but i am determined ot get it wokring on windows)

install wsl2

install a linux distro from microsoft store, insttuctions for ubuntu are given here

follow linux instruction below:

on linux:

sudo apt update

install flite

install lua5.3

sudo apt-get install lua5.3

sudo apt-get install liblua5.3-dev

sudo apt-get install luarocks

sudo luarocks install luasocket

sudo apt-get install lua-posix

clone this repo

git clone https://github.com/amigojapan/BlindOS

edit tmpDir="/home/amigojapan/projects/BlindOS/tmp" in settings.lua. it must be a full absolute path to BlindOS/tmp

./BlindOE.lua


—up to here most things have been implemented

To do:

0). Blind Menu (a kind of desktop for those who prefer to use a menu rather than commands, works kind of like a menu on the telephone)

1). BlindWEB (A web client that accesses a group of webpages designed  specifically for the blind), this will also allow people to host their own applications made for BlindOS on the web 

2). Blind Mail Client

3). Blind Music Player

4). Blind App Downloader(package manager)

Other applications for the blind are welcome and will be added to BlindOS




# Join me in irc.libera.chat in channel #BlindOE
