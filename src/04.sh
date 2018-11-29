#!/bin/bash -v

# `./04.sh hola 1 "How are you?"`

# Expands to the positional parameters, starting from one
echo $*

# Expands to the positional parameters, starting from one, each parameter expands to a separate word
echo $@

# $* vs. $@
# The implementation of "$*" has always been a problem and realistically should have been replaced with the behavior of "$@".

# Expands to the number of positional parameters in decimal
echo $#

# Expands to the exit status of the most recently executed foreground pipeline.
ls doesnotexist
ls nothing
echo $?

# A hyphen expands to the current option flags as specified upon invocation
echo $-

# Expands to the process ID of the shell.
echo $$

# Expands to the process ID of the most recently executed background (asynchronous) command
# The amperson character at the end means run in background this command
galculator &

ps aux | grep -v grep | grep -i -e VSZ -e galculator

echo $!

# Expands to the name of the shell or shell script
echo $0

# The underscore variable is set at shell startup and contains the absolute file name of the shell or script being executed as passed in the argument list
echo $_


# Print echo variables
echo "Parameter #1:" $1
echo
echo "Parameter #2:" $2
echo
echo "Parameter #3:" $3


readonly MYVAR="I can't change"
MYVAR="Other stuff"
echo $MYVAR
