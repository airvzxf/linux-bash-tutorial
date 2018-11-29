#!/bin/bash

# Basic example with some echos

clear

echo "This is information provided by mysystem.sh.  Program starts now."
echo "Hello, $USER"
echo

echo "Today's date is `date`, this is week `date +"%V"`."
echo

echo "These users are currently connected:"
w | cut -d " " -f 1 - | grep -v USER | sort -u
echo

echo "This is `uname -s` running on a `uname -m` processor."
echo

echo "This is the uptime information:"
uptime
echo

echo "Scape line with space allows to create one commandline into multiple commandlines"
ls -lha \
sed* \
01.sh \
bash.txt
echo "This line is not part of the multiple comandlines"
