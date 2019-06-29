#!/bin/bash

#Display the UID and Username of te user executing this script.
#Display if the user is the vagrant user or not.


#Display the UID

echo "Your user id is ${UID}"
#Only display if the UID does not match 1000.
UID_TO_TEST_FOR='1000'
if [[ "${UID}" != "${UID_TO_TEST_FOR}" ]]
then
   echo "Your UID does not match ${UID_TO_TEST_FOR}."
   exit 1
fi

#Display the username
USER_NAME=$(id -un)

#Test if the command  succeeded
if [[ "${?}" -ne 0 ]]
then 
   echo 'The id command di not execute succesfully.'
   exit 1
fi

echo "Your username is ${USER_NAME}"

#You can use a string test conditional
USER_NAME_TO_TEST_FOR='marcolcal'
if [[ "${USER_NAME}" = "${USER_NAME_TO_TEST_FOR}" ]]
then
   echo "The username matches the user that your are testing for ${USER_NAME_TO_TEST_FOR}"
fi
#Test for != (not equal) for the string

if [[ "${USER_NAME}" != "${USER_NAME_TO_TEST_FOR}" ]]
then
   echo "Your username does not match ${USER_NAME_TO_TEST_FOR}."
   exit 1
fi

exit 0

