#!/bin/bash
#Create a simple while loop in bash that prints the numbers 1-20 to stdout.

#It should look like (stdout):

#Count: 1
#Count: 2
#...
#Count: 20

function countToTwenty() {
  for i in {1..20}
    do
      echo "Count: $i"
    done
}

countToTwenty