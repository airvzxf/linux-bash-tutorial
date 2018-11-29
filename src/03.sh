#!/bin/bash

# We are able to use directly in the init line: `!/bin/bash -xfv`

# Start debugging
set -x

echo "Debugging on the entire script"

# How to save commands into vars
me=$(whoami)

# How to print vars
echo "My name is ${me}"


# Stop debugging
set +x

# Echo -e, accept scape characters
echo ""
echo "Stop debugging"

me=$(whoami)

echo "My name is ${me}"
echo -e "\n\n"


# Disable the asterisk character when the user is looking for files
set -f

echo "Should not show all the files:"
ls *
echo

set +f

echo "Should show all the files:"
ls *
echo -e "\n\n"



# Verbose debbug mode

# looking in the console it keep the spaces in the code which are reflected in the consolo output
set -v

echo "Debugging on verbose mode"

# How to save commands into vars
me=$(whoami)

# How to print vars
echo "My name is ${me}"

set +v
echo -e "\n\n"


# Mixing Debugging and Verbose
set -x
echo "debug message: now attempting to start w command"; w
set +x
echo -e "\n\n"

set -v
echo "debug message: now attempting to start w command"; w
set +v
echo -e "\n\n"

set -xv
echo "debug message: now attempting to start w command"; w
set +xv
echo -e "\n\n"
