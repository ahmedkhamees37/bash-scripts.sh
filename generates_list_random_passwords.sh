#!/bin/bash
#this script to generates a list of random passwords.

# a random number as a password
PASSWORD=${RANDOM}
echo "${PASSWORD}" 

#three random numbers as a password
PASSWORD=${RANDOM}${RANDOM}${RANDOM}
echo "${PASSWORD}"

#use the current date/time as the basic for the password

PASSWORD=$(date +%s)
echo "${PASSWORD}"

#use nanoseconds as the basis for the password
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

# a better password
PASSWORD=$(date +%s%N | sha256sum | base64 | head -c 32)
echo "${PASSWORD}"

# Append a special character to the password
SPECIAL_CHARACTER=$(echo "!@#$%^&*()" | fold -w1 | shuf | head -c 1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"
