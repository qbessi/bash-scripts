#!/bin/bash

# Make a Function that returns a comma separated list in the order of
# "DirectoryName, Filename, FileExtension"


function splitDir() {

  DIR=$(dirname "$1")

  NAME=$(basename "$1" | cut -d '.' -f1)

  EXT=$(basename "$1" | cut -d '.' -f2)

  echo "$DIR, $NAME, $EXT"
}

splitDir "$1"