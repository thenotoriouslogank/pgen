#!/bin/bash

#Simple Password Generator for use with, like, generating passwords (and saving them locally on your machine.)

#This script was inspired by the work off HackerSploit from his video here: https://www.youtube.com/watch?v=P5552IJp7tU

#Do not run as sudo unless you want the output of .xplog to go to the root directory (chances are you don't).

echo 'This is a basic password generator.'
echo 'It will allow password generation using'
echo 'either base64 or hex encryption.'
echo 'By default, it will also keep an'
echo 'ongoing log file of generated passwords and'
echo 'their associated usernames/nicknames.'

#Allows user time to read introductory statements before clearing the screen and moving on.
sleep 8
clear

echo 'Please enter a nickname for this password'
echo '(website or username for example).'
echo ""
echo 'Note that this will be how your password'
echo 'is labeled in the save file'
read PASSNICK
echo $PASSNICK > .plog.txt
echo 'Please enter length of password'
read PASSLENGTH #I don't know what the maximum
                #length is but I have personally
                #done up to 256

#For the letters (p) in (sequence1) do the following: creates 48 base64 characters
#using openssl and cutting thhe length to that specified by the user

#replace '-base64' in with '-hex' for a less-secure but more-easily-readable password.

#The .plog.txt file is a temporary file deleted after the entry is created.

for p in $(seq 1 1);
do
     openssl rand -base64 48 | cut -c1-$PASSLENGTH
done >> .plog.txt

#Creates the hidden .xplog.txt file if it doesn't already exist.
touch /$HOME/.xplog.txt >> /$HOME/.xplog.txt
#Appends the output of the individual entry to the .xplog.txt file.
cat .plog.txt >> /$HOME/.xplog.txt
#Inserts timestamp.
date >> /$HOME/.xplog.txt
#Deletes the .plog.txt file
rm .plog.txt

echo "Done."
