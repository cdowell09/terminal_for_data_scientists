#!/bin/bash

set -e

echo "What is your name"?
read -r name

echo "What is your age?"
read -r age

if [ "$age" -lt 18 ]; then
    echo "$name you are a minor."
elif [ "$age" -ge 18 ] && [ "$age" -lt 65 ]; then
    echo "$name you are an adult."
else
    echo "$name you are a senior citizen."
fi