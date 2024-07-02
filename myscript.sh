#!/bin/bash

# If-else statements

FILE="data.csv"
if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE does not exist."
fi

# For loops
for i in {1..5}
do
    echo "Number :$i"
done
counter=1

# while loops
while [ $counter -le 5 ]
do
    echo "Counter: $counter"
    ((counter++))
done

# functions

greet() {
    echo "Hello, $1!"
}

greet "Alice"
greet "Bob"