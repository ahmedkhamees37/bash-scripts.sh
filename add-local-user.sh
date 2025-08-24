#!/bin/bash
# script name add-local-user.sh
# This script creates a new user on the local system.
# You will be prompted to enter the username (login), the person name, and a password.
# The username, password, and host for the account will be displayed.

# Make sure the script is being executed with supervisor privileges.
if [ "${UID}" -ne 0 ]
then
  echo "You must run this script with superuser privileges."
  exit 1
fi

# Get the username
read -p "Enter the username (login): " username

# Get the real name (contents for the description field)
read -p "Enter the person name: " person_name       

# Get the password
read -p "Enter the password: " password

# Create the account
useradd -c "${person_name}" -m "${username}"

# Check to see if the useradd command succeeded.
# We don't want to tell the user that an account was created when it hasn't been.
if [ "${?}" -ne 0 ]
then
  echo "The account could not be created."
  exit 1
fi
# Set the password.
echo "${password}" | passwd --stdin "${username}"

# Force password change on first login
chage -d 0 "${username}"

# Display account information
echo "Account created successfully:"
echo "Username: ${username}"
echo "Real Name: ${person_name}"
echo "Password: ${password}"

exit 0
# End of script
