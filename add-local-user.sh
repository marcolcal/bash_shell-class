#!/bin/bash
#
#This script creates a user in the local system
#You will be prompted to eneter the username (login), the person name and the password.
#The username , password, and host for the account will be displayed


#make sure the script is being executed with superuser privileges

if [[ "${UID}" -ne 0 ]]
then
    echo 'PLease run with sudo or as root,'
    exit 1
fi

#Get the username (login).
read -p 'Enter the username to create: ' USER_NAME

#Get the real name of the user (contents for the description field).
read -p 'Enter the name of the person or application that will be using this account: ' COMMENT

#Get the password
read -p 'Enter the password to use for the account: ' PASSWORD

#Create the account
useradd -c "${COMMENT}" -m "${USER_NAME}"

#Check to see if the username command succeeded
#We dont want to tell the user that an account was created when it wasnt creted

if [[ "${UID}" -ne 0 ]]
then
    echo 'PLease run with sudo or as root,'
    exit 1
fi

#Set the password for the account
echo "${USER_NAME}:${PASSWORD}" | chpasswd

if [[ "${?}" -ne 0 ]]
then
    echo 'The password for the account could not be set.'
    exit 1
fi

#Force the password change in the first login.
passwd -e "${USER_NAME}"

#Display the username, password, and the host where the user was created
echo
echo 'username:'
echo "${USER_NAME}"
echo
echo 'password: '
echo "${PASSWORD}"
echo
echo 'host: '
echo "${HOSTNAME}"

exit 0
