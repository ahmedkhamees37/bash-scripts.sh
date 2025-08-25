#!/bin/bash
# this script generates a random password for each user specified in the input file on the command line

#display what the user typed on the command line
echo "You Executed this command: ${0}"

#Display the path and filename of the script.
echo "You used $(dirname "${0}") as the the path to the $(basename "${0}")"

#Tell them how many arguments were passed to the script.
echo "You passed $# arguments to the script."

#Make sure they at least supply one argument
if [ $# -lt 1 ]; then
  echo "You must supply at least one argument."
  exit 1
fi

# generate and display a password for each user
for USER_NAME in "$@"; do
  PASSWORD=$(date +%s%N | sha256sum | base64 | head -c 32)
  echo "Generated password for user '${USER_NAME}': ${PASSWORD}"
done
