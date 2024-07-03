# Bash Scripting: Error Handling and Debugging

## Introduction

Error handling and debugging are essential skills for writing reliable bash scripts. In this lesson, we'll learn how to anticipate and handle errors, as well as techniques for debugging bash scripts.

## Error Handling

### 1. Exit Statuses

In bash, every command returns an exit status (0-255):
- 0 typically means success
- Any non-zero value indicates an error

You can check the exit status of the last command using `$?`.

Example:

```bash
#!/bin/bash

ls /nonexistent_directory
echo "Exit status: $?"

ls /home
echo "Exit status: $?"
```

### 2. The set Command

The `set` command allows you to change shell options. Two useful options for error handling are:

- `set -e`: Exit immediately if a command exits with a non-zero status.
- `set -u`: Treat unset variables as an error when substituting.

Example:

```bash
#!/bin/bash
set -e
set -u

echo "This will run"
non_existent_command  # Script will exit here
echo "This will not run"
```

### 3. Trap Command

The `trap` command allows you to catch signals and execute commands when they occur.

Example:

```bash
#!/bin/bash

trap 'echo "Script interrupted."; exit 1' INT

echo "Script is running..."
sleep 10
echo "Script completed."
```

This script will print "Script interrupted." and exit if you press Ctrl+C.

### 4. Custom Error Handling

You can create your own error handling functions:

```bash
#!/bin/bash

error_exit() {
    echo "Error: $1" >&2
    exit 1
}

# Usage
if [ ! -f "important_file.txt" ]; then
    error_exit "important_file.txt not found."
fi
```

## Debugging Techniques

### 1. Echo Statements

The simplest form of debugging is to add echo statements to your script:

```bash
#!/bin/bash

echo "Debug: Starting script"
variable="Hello, World!"
echo "Debug: variable = $variable"
```

### 2. Set -x Option

The `set -x` option prints each command and its arguments as they are executed:

```bash
#!/bin/bash
set -x

name="Alice"
echo "Hello, $name!"
```

### 3. Bash Debug Mode

Run your script with bash's debug mode:

```bash
bash -x ./your_script.sh
```

### 4. PS4 Variable

Customize the debug output prefix by setting the PS4 variable:

```bash
#!/bin/bash
export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
set -x

name="Alice"
echo "Hello, $name!"
```

### 5. Shellcheck

Shellcheck is a static analysis tool for shell scripts. Install it on your system and use it to check your scripts for common errors and pitfalls:

```bash
shellcheck your_script.sh
```

## Practice Exercises

1. Write a script that attempts to create a directory and write a file to it. Use error handling to check if each operation was successful.

2. Create a script that takes a filename as an argument. If the file doesn't exist, use your custom error handling function to exit with an informative error message.

3. Write a script with deliberate errors, then use the debugging techniques we've learned to identify and fix the errors.

## Conclusion

Error handling and debugging are crucial skills for writing robust bash scripts. By anticipating potential errors and using debugging techniques, you can create more reliable and maintainable scripts.

In our next lesson, we'll dive into text processing with sed and awk, powerful tools for manipulating and analyzing text data in bash scripts.