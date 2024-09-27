#!/bin/bash

# Make a Function that returns a comma separated list in the order of
# "DirectoryName, Filename, FileExtension"


function split_dir() {

  dir=$(dirname "$1")

  name=$(basename "$1" | cut -d '.' -f1)

  ext=$(basename "$1" | cut -d '.' -f2)

  echo "$dir, $name, $ext"
}

split_dir "$1"