#!/bin/bash

echo "enter file name:"
read -r filename

if test -f $filename; then
  echo "File exists."
elif ! test -f $filename; then
  echo "File does not exist."
fi