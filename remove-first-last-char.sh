#!/bin/bash

#It's pretty straightforward. Your goal is to create a function that removes the first and last characters of a string. You're given one parameter, the original string. You don't have to worry about strings with less than two characters.

function removeChar() {
    local string="$1"
    if [ ${#string} -ge 2 ]; then
        echo "${string:1:-1}"
    else
        echo "$string"
    fi
}

removeChar "$1"