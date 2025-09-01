#!/bin/bash
# this script creates a new user on the local system.
# you must supply a username as an argument to the script.
# optionally, you can also provide a comment for the account as an argument.
# A Password will be automatically generated for the new user.
# the username,password, and host for the account will be displayed.

# Make sure the script is being executed with superuser priviledges.

if [ ${UID} -ne 0 ]
then
  echo "Please run with sudo or as root."
  exit 1
fi

# if they don't supply at least one argument , then give then help.

if [ ${#} -lt 1 ]
 then
  echo "Usage: $0 <username> [comment]..."
  echo '  <comment>  A comment for the new user account (optional)'
  exit 1
fi


#the first parameter is the user name 
USER_NAME=${1}

#the rest of the parameters are for the comment
shift
COMMENT="${@}"
#generate a password
PASSWORD=$(date +%s%N | sha256sum | base64 | head -c 32)

# Create the user with the password
useradd -c "${COMMENT}" -m "${USER_NAME}"

# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.  
if [[ $? -ne 0 ]]  
then  
    echo 'The account could not be created.'  
    exit 1  
fi

#set the password
echo "${PASSWORD}" | passwd --stdin "${USER_NAME}"
# Check to see if the passwd command succeeded.
if [[ ${?} -ne 0 ]]
then
    echo 'The password could not be set.'
    exit 1
fi
# Force password change on first login.
chage -e "${USER_NAME}"

#display account information
echo "Account created successfully!"
echo "Username: ${USER_NAME}"
echo "Password: ${PASSWORD}"
echo "Host: $(hostname)"
exit 0
