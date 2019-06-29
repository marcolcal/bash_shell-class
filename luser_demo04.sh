#!/bin/bash


#This script creates an account on the local system
#You will be prompted for the username and password

#Ask for the username.
read -p 'Enter the username to cerate: ' USER_NAME

#Ask for the real name.
read -p 'Enter the name of the person who this account is for: ' COMMENT

#Ask for passwd
read -p 'Enter a super secure password that you wont forget: ' PASSWORD

#Create the user.
useradd -c "${COMMENT}" -m ${USER_NAME}

#Set the password for that user.
#echo "${PASSWORD}\n${PASSWORD}" | passwd ${USER_NAME}
echo "${USER_NAME}:${PASSWORD}" | chpasswd
#Force password change on the first login.
passwd -e ${USER_NAME}
