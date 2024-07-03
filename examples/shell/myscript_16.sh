#!/bin/bash

age=25

if [ $age -lt 18 ]; then
    echo "You are a minor."
elif [ $age -ge 18 ] && [ $age -lt 65 ]; then
    echo "You are an adult."
else
    echo "You are a senior citizen."
fi

for fruit in apple banana orange
do
    echo "I like $fruit"
done

count=1
while [ $count -le 5 ]
do
    echo "Count is: $count"
    count=$((count + 1))
done

echo "Enter a fruit name:"
read fruit

case $fruit in
    "apple")
        echo "Apple is red."
        ;;
    "banana")
        echo "Banana is yellow."
        ;;
    "orange")
        echo "Orange is orange."
        ;;
    *)
        echo "I don't know that fruit."
        ;;
esac