#!/bin/bash
#this script to display user information
#display if the user is root or not
echo "Your UID Is ${UID}"
echo "Your Username Is ${USER}"

if [ ${UID} -eq 0 ]
then
  echo "You Are Root User"
else
  echo "You Are Not Root User"
fi
