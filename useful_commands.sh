#!/bin/sh
# This file contain common useful commands which can be use in the linux system

##Basic commands for io operation on files

## move/select to a particular directory
# cd <path_of directory> e.g cd . | cd /opt | cd tomcat | cd ~/.ssh
#change to current directory
cd .
#Navigate to a folder back from current location
cd ..

## Creating a directory
# command : mkdir <directory_name>
mkdir temp #it will create a directory temp on current location
mkdir -p dev/projects/temp # -p argument make sure to create all folder if not preset, quite handy and useful command


## Directory cleanup
# Command: rm <file_name>
rm hello.txt # single file deletion
rm -r *.txt # deleting file recursively which match pattern *.txt
rm -rf bin* # very powerful command AVOID using it, as it delete recursively all files and folder under matching criteria


## Creating a file 
#Commands which can be use to create file 
touch a.txt # create a file with empty content on the current location
echo > a.txt # create/replace a file on a.txt 
echo hello >> a.txt # append content hello on a.txt
vi a.txt # it will create / open file if already present on the location to operate on that follow vi/vim commands for file manipulation


## View content of the file
# we can use multiple commands for viewing content of a file
cat a.txt
vim console.log
vi catalina.out

##Copying content of file/ folder
cp <source> <destination>
cp a.txt ./temp1/ 
cp -r temp temp1/

## Finding list of content on a given location
# command : ls
ls -la # list down all including hidden files
ls -ltr # list down files including time in reverse order
ls <file_regex|folder_regex>
 
# Loading the environment variable again from a property file
# e.g. if there is any change on the properties in bash_profile or any environment variable then to reload the variables on already open terminal instance
#e.g. source <local/file_name>
source ~/.bash_profile # so we are reloading the environment variable again from the .bash_profile present in the root directory


#Making a variable in file to make it globally accessible
# e.g. export <VARIABLE_NAME>

export JAVA_HOME="/d/tool/java_1.8"

# Statement to see already saved values in terminal
# e.g. echo <VARIABLE_NAME/ VALUE>
echo "Checking JAVA_HOME variable"
echo $JAVA_HOME


## Overriding temporarily a variable on the current terminal so that cane be reflect just for same terminal
## assuming let say we have path variable accessed on the terminal
## in e.g we are trying to append new path on the environment variable

PATH=$PATH:"/d/dev/projects" # Plz note path separator ":"" is being used in Linux and Mac system however ";" is used as a separator on windows


## View running logs on a file
# tail -500f <file_name>
tail -500f catalina.out

## We can use grep command to filter out a specific log from the running logs

#tail -500f <file_name> | grep <pattern/text to be fetched>
tail -500f catalina.out | grep "Error" # Filtering out Error from the logs which are being written on the catalina.out file.


## Check Running process on a machine
# e.g. ps -ef
ps -ef

ps -ef | grep "java" # filter out a specific process using grep commands