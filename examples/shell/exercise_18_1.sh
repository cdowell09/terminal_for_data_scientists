#!/bin/bash

set -e

mkdir test_directory
cd test_directory
touch test_file.txt

# check to see if the file exists
cat test_file.txt
echo "Delete the file? [yes/no]"
read -r del_bool

if [ "$del_bool" ]; then
    cd ..
    rm -rf test_directory
fi