#!/bin/bash
set -x

echo "Enter a number:"
read number

count=1
while [ $count -le $number ]
do
    result=$(( $count * $number )) 
    echo "$count*$number = $result"
    count=$((count + 1))
done