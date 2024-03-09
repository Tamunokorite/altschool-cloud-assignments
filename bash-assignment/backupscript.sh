#!/usr/bin/bash

# Q2. 
# Create a backup script. This script creates a backup of a given directory and saves it in another directory with a timestamp. It takes two arguments:
# the source directory and the destination directory

current_timestamp=$(date +"%Y_%m_%d_%H-%M-%S")
destination=$2$current_timestamp.tar.gz

tar -czf $destination $1
echo $destination