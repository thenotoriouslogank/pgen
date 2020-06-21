#!/bin/bash

#Simple Password Generator for use with, like, generating passwords (and saving them locally on your machine.)

#This script was inspired by the work off HackerSploit from his video here: https://www.youtube.com/watch?v=P5552IJp7tU

echo 'This is a basic password generator.'
echo 'It will allow password generation using'
echo 'either base64 or hex encryption.'
echo 'By default, it will also keep an'
echo 'ongoing log file of generated passwords and'
echo 'their associated usernames/nicknames.'

sleep 10
clear

echo 'Please enter a nickname for this password'
echo '(fireffox or ssh for example).'
echo 'Note that this will be how your password'
echo 'is labeled in the save file'
read PASSNICK
echo $PASSNICK > .plog.txt
echo 'Please enter length of password'
read PASSLENGTH

#For the letters (p) in (sequence1) do the following: creates 48 base64 characters
#using openssl and cutting thhe length to that specified bbbby the user

#replace '-base64' in with '-hex' for a less-secure but more-easily-readable password.

for p in $(seq 1 1);
do
     openssl rand -base64 48 | cut -c1-$PASSLENGTH
done >> .plog.txt

touch /~/.xplog.txt > /~/.xplog.txt
cat .plog.txt >> /~/.xplog.txt
rm .plog.txt

echo "Done."
