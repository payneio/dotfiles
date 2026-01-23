#!/bin/zsh

# Get my name from the system to make it easily available everywhere I might
# need it
if [[ "$(whence -w getent)" == *"function"* ]]; then
  export MYFULLNAME=$(getent passwd $(whoami) | cut -d ':' -f 5 | cut -d ',' -f 1)
fi

# an argument to the cd builtin command that is not a directory is assumed to
# be the name of a variable whose value is the directory to change to.
setopt CDABLE_VARS

# Check the window size after each command is automatic in zsh
