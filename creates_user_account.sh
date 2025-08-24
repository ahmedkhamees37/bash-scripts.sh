#!/bin/bash

# This script creates an account on the local system.
# You will be prompted for the account name and password.

# Ask for the user name.

echo "Enter the username: "
read username

# Ask for the real name.

echo "Enter the real name: "
read realname

# Ask for the password.

echo "Enter the password: "
read password

# Create the user.
useradd -c "$realname" -m "$username"

# Set the password for the user.
echo "$username:$password" | chpasswd

# Force password change on first login.
passwd -e "$username"
