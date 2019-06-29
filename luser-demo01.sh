#!/bin/bash

#This is a comment
#This script displays various infromation to the screen

#Display 'Hello'
echo 'Hello'

#assign a value to a variable
WORD='script'

#Display Variable
echo "$WORD"

date

#combine the variable with hard-coded text
echo "This is a shell $WORD"

#Display the contents of our variable using an alternative syntax
echo "This is a shell ${WORD}"

#If we are appending text to a variable we need to use the {} syntax convention
echo "${WORD}ing is fun"

#Creating another variable
ENDING='ed'

#Combining variables
echo  " This is ${WORD}${ENDING}"

#REassignment 
ENDING='ing'

echo "This is ${WORD}${ENDING} fun"
