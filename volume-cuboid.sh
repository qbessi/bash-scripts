#!/bin/bash

#Bob needs a fast way to calculate the volume of a cuboid with three values: the length, width and height of the cuboid. Write a function to help Bob with this calculation.

#In bash the script is ran with the following 3 arguments: length width height

function cuboid_volume() {
  length=$1
  width=$2
  height=$3

  echo $(echo "$length * $width * $height" | bc)
}

cuboid_volume $1 $2 $3