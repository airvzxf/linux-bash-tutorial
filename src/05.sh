#!/bin/bash -v

# Escape characters
date=20021226


echo $date

echo \$date


echo '$date'

echo "$date"

echo "`date`"

echo `date`


echo "I'd say: \"Go for it!\""


# echo "\" # Throws an error
echo "\\"



# Brace expansion
echo sp{el,il,al}l



# Variable expansion

echo $FRANKY

echo ${FRANKY:=Franky}



# Arithmetic expansion

echo $[365*24]

echo $[4+2]

echo $[3/2]



# The noclobber option, which prevents existing files from being overwritten by redirection operations

set -o noclobber
touch test
echo "New code!" > test
set +o noclobber

touch test
echo "New code!" > test
cat test
rm -f test



# Regular expressions

grep -n root /etc/passwd

grep ^root /etc/passwd

grep [w] /etc/group



# The GNU sed stream editor

cat -n sed_example

# Print file and matches at the same time
sed '/erors/p' sed_example

# Print only matches
sed -n '/erors/p' sed_example

# Delete lines which have the erors word
sed '/erors/d' sed_example

# Match only when it start with This word
sed -n '/^This.*errors.$/p' sed_example

# Delete line 2-4
sed '2,4d' sed_example

# Delete from line 3 until the end
sed '3,$d' sed_example

# Multiple search using two words
sed -n '/a text/,/This/p' sed_example

# Find and replace
sed 's/erors/ERRORS/' sed_example

# Find and replace, replace all the occurrences per line
sed 's/erors/ERRORS/g' sed_example

# Add greater than symbol before start the line
sed 's/^/> /' sed_example

# Insert some string at the end of each line
sed 's/$/EOL/' sed_example

# Multiple find and replace commands are separated with individual -e options
sed -e 's/erors/ERRORS/g' -e 's/last/FINAL/g' sed_example




# Fields in awk
ls -l | awk '{ print $5 $9 }'

# Formatting fields
ls -ldh * | grep -v total | awk '{ print "Size is " $5 " bytes for " $9 }'

# You can take out any number of columns and even reverse the order
df -h

df -h | head -3 | awk '{ print "Partition " $6 "\t: " $5 " full!" }'

df -h | sort -rnk 5 | head -3 | awk '{ print "Partition " $6 "\t: " $5 " full!" }'

df -h | awk '/dev/ { print $6 "\t: " $5 }'



# Conditional statements

# IF

set -o noclobber

if [ -o noclobber ]
  then
	echo "Your files are protected against accidental overwriting using redirection."
fi

set +o noclobber


if [ "$(whoami)" != 'root' ]; then
        echo "You have no permission to run $0 as non-root user."
fi


gender="male"
if [[ "$gender" == "f*" ]]
then echo "Pleasure to meet you, Madame."
else echo "How come the lady hasn't got a drink yet?"
fi



# Case / Switch

space=99

case $space in
[1-6]*)
  Message="All is quiet."
  ;;
[7-8]*)
  Message="Start thinking about cleaning out some stuff.  There's a partition that is $space % full."
  ;;
9[1-8])
  Message="Better hurry with that new disk...  One partition is $space % full."
  ;;
99)
  Message="I'm drowning here!  There's a partition at $space %!"
  ;;
*)
  Message="I seem to be running with an nonexistent amount of disk space..."
  ;;
esac

echo $Message
