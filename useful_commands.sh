#!/bin/sh
# This file contain common useful commands which can be use in the linux system

# Loading the envirionment variable again from a property file
# e.g. if there is any change on the properties in bash_profile or any environment varibale then to reload the variables on already open terminal instance 
#e.g. source <local/file_name>
source ~/.bash_profile # so we are relaoding the environment variable again from the .bash_profile present in the root directory


#Making a variable in file to make it globally accessible
# e.g. export <VARIABLE_NAME>

export JAVA_HOME="/d/tool/java_1.8"

# Statement to see already saved values in terminal
# e.g. echo <VARIABLE_NAME/ VALUE>
echo "Checking JAVA_HOME variable"
echo $JAVA_HOME


## Overriding temporaryly a variable on the current terminal so that cane be reflect just for same terminal
## assuming let say we have path variable accessed on the terminal
## in e.g we are trying to append new path on the environment variable

PATH=$PATH:"/d/dev/projects" # Plz note path separator ":"" is being used in Linux and Mac system however ";" is used as a separator on windows


## View running logs on a file
# tail -500f <file_name>
tail -500f catalina.out

## We can use grep command to filter out a specific log from the running logs

#tail -500f <file_name> | grep <pattern/text to be fetched>
tail -500f catalina.out | grep "Error" # Filtering out Error from the logs which are being written on the catalina.out file.


## Check Running proceses on a machine
# e.g. ps -ef
ps -ef

ps -ef | grep "java" # filter out a specific process using grep commands