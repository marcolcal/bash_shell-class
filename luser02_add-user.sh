#!/bin/bash

#We want to check if the user is root
echo "The current user UID is ${UID}"
#Display the username
USER_NAME=$(whoami)
echo "The username is ${USER_NAME}"

#if the user is root add a user and set and expiration date to his password
#we want use positional variables to do this.

if [[ "${USER_NAME}" = "root" ]]
then
	USER_TO_CREATE=${1}
	PASSWORD=${2}
	echo 'You are root'
	useradd "${USER_TO_CREATE}"
	#change password
	echo "${USER_TO_CREATE}":"${PASSWORD}" | chpasswd
	FIND_LAST_USER=$(awk -F ":" '{print $1}' /etc/passwd | tail -n 1)
	echo "You have created a new user named ${FIND_LAST_USER}"
else
	echo 'You are not root'
fi
