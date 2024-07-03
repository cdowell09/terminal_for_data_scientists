# Advanced Bash Scripting: Control Structures and Functions

## Introduction to Bash Scripting

Bash (Bourne Again SHell) is a command-line interface and scripting language used in many Unix-based systems, including Linux and macOS. Bash scripting allows you to automate tasks, create complex command sequences, and build powerful utilities.

## Setting Up

Before we start, ensure you have a text editor and access to a terminal. You can use any text editor (like nano, vim, or VSCode) to write your scripts.

To create a new bash script:

1. Open your terminal
2. Create a new file with a .sh extension: `touch myscript.sh`
3. Make it executable: `chmod +x myscript.sh`
4. Open it in your text editor

Always start your bash scripts with a shebang:

```bash
#!/bin/bash
```

This line tells the system to use bash to interpret the script.

## Control Structures

Control structures in bash allow you to control the flow of your script's execution.

### 1. If-Else Statements

If-else statements allow you to make decisions in your scripts.

Basic syntax:

```bash
if [ condition ]; then
    # commands if condition is true
elif [ another_condition ]; then
    # commands if another_condition is true
else
    # commands if all conditions are false
fi
```

Example:

```bash
#!/bin/bash

age=25

if [ $age -lt 18 ]; then
    echo "You are a minor."
elif [ $age -ge 18 ] && [ $age -lt 65 ]; then
    echo "You are an adult."
else
    echo "You are a senior citizen."
fi
```

Note: In bash, spaces are important. Make sure to put spaces around the brackets and operators.

### 2. Loops

Loops allow you to repeat a set of commands multiple times.

#### For Loop

Basic syntax:

```bash
for variable in list
do
    # commands
done
```

Example:

```bash
#!/bin/bash

for fruit in apple banana orange
do
    echo "I like $fruit"
done
```

#### While Loop

Basic syntax:

```bash
while [ condition ]
do
    # commands
done
```

Example:

```bash
#!/bin/bash

count=1
while [ $count -le 5 ]
do
    echo "Count is: $count"
    count=$((count + 1))
done
```

### 3. Case Statements

Case statements are useful when you have multiple conditions to check against a single variable.

Basic syntax:

```bash
case $variable in
    pattern1)
        # commands for pattern1
        ;;
    pattern2)
        # commands for pattern2
        ;;
    *)
        # default commands
        ;;
esac
```

Example:

```bash
#!/bin/bash

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
```

## Functions

Functions in bash allow you to group commands and reuse code.

Basic syntax:

```bash
function_name() {
    # commands
}
```

Example:

```bash
#!/bin/bash

greet() {
    echo "Hello, $1! Nice to meet you."
}

greet "Alice"
greet "Bob"
```

In this example, `$1` refers to the first argument passed to the function.

### Function with Return Value

Bash functions don't return values like in other programming languages, but you can use the `return` command to return an exit status.

Example:

```bash
#!/bin/bash

is_even() {
    if [ $(($1 % 2)) -eq 0 ]; then
        return 0  # true in bash
    else
        return 1  # false in bash
    fi
}

number=42
if is_even $number; then
    echo "$number is even"
else
    echo "$number is odd"
fi
```

## Practice Exercises

1. Write a script that asks the user for their name and age, then uses an if-else statement to print a message based on their age.

2. Create a script that uses a for loop to print the multiplication table of a number entered by the user.

3. Write a function that takes two numbers as arguments and returns their sum. Use this function in a script to add pairs of numbers.

Remember to make your scripts executable (`chmod +x script_name.sh`) and run them with `./script_name.sh`.

## Conclusion

This lesson covered the basics of control structures and functions in bash scripting. These concepts form the foundation for creating more complex and powerful scripts. Practice writing scripts using these structures to become more comfortable with bash scripting.

In the next lesson, we'll cover more advanced topics like error handling and debugging in bash scripts.