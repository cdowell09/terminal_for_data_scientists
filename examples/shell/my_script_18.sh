#!/bin/bash

set -x # prints each command and it's arguments as they are executed

ls /nonexistent_directory
echo "Exit status: $?"

ls /home
echo "Exit status: $?"

# # Set Command
# set -e # exit immediately if a command exits with a non-zero sattus
# set -u # treat unset variables as an error when substituting

# echo "This will run"
# non_existent_command  # Script will exit here
# echo "This will not run"


trap 'echo "Script interrupted."; exit 1' INT

echo "Script is running..."
sleep 10
echo "Script completed."

#!/bin/bash
export PS4='+(${BASH_SOURCE}:${LINENO}): ${FUNCNAME[0]:+${FUNCNAME[0]}(): }'
set -x

name="Alice"
echo "Hello, $name!"