#!/bin/bash

#Clock shows h hours, m minutes and s seconds after midnight.

#Your task is to write a function which returns the time since midnight in milliseconds.
#Example:

#h = 0
#m = 1
#s = 1

#result = 61000

h=$(($1 * 60 *  60 * 1000))
m=$(($2 * 60 * 1000))
s=$(($3 * 1000))
result=$((h + m + s))

function since_midnight() {
    echo $result
}

since_midnight