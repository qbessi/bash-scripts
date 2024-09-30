#!/bin/bash

#Write a function that removes the spaces from the string, then return the resultant string.

function removeSpaces() {
  echo "$1" | tr -d ' '
}

removeSpaces "$1"