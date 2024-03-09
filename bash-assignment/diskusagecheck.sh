#!/usr/bin/bash

# Q1. 
# Write a shell script that checks the disk usage in a given directory.
# the script can take two optional arguments and one compulsory argument...
# -d: which means that all files and directory within the specified directory or directories should be listed.
# -n: which means that the top N enteries should be returned.
# list of directories: this will be the directories you want to check it's disk usage

# eg yourscript.sh -n 5 /var
# should return the top 5 directories wrt disk usage in /var directory

# yourscript.sh -d /var
# should list both directories and files

# Note: if -n argument is not given, it should return 8 enteries by default.


if [[ $1 == '-d' ]]; then
# handling the case where argument 1 is -d e.g ./diskusage.sh -d /var
du -ah $2 | sort -rh | tail -n +2
elif [[ $1 == '-n' ]]; then
# handling the case where argument 1 is -n e.g ./diskusage.sh -n 5 /var
if [[ $2 =~ ^[0-9]+$ ]]; then
# handling the case where argument 1 is and argument 2 is a number -n e.g ./diskusage.sh -n 5 /var
du -ah $3 | sort -rh |tail -n +2 | head -$2
else
# handling the case where argument 1 is -n and argument 2 is not a number (i.e -n argument is not given)  e.g ./diskusage.sh -n /var
du -ah $2 | sort -rh |tail -n +2 | head -8
fi
else
# handling the case where the optional arguments are not given  e.g ./diskusage.sh /var
du -ah $1 | sort -rh | tail -n +2
fi