#!/bin/bash

#This script generates a list of random passwords


#RANDOM number as a passworrd
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

#Three random numbers all together
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}"

#Use the current date/time as the basis for the password.
PASSWORD=$(date +%s)
echo "${PASSWORD}"

#Use nanoseconds to act as randomization
PASSWORD=$(date +%s%N)
echo "${PASSWORD}"

#we are creating a better password
PASSWORD=$(date +%s%N | sha256sum | head -c32)
echo ${PASSWORD}

#Creating an even better passwprd
PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}"

#Append a special character to the password
SPECIAL_CHARACTER=$(echo '~!@#$%^&*()_+=' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"
