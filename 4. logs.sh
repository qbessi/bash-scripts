#!/bin/bash

echo ".::           .::::        .::::     .:: ::  "
echo ".::        .::    .::   .:    .:: .::    .::"
echo ".::      .::        .::.::         .::      "
echo ".::      .::        .::.::           .::    "
echo ".::      .::        .::.::   .::::      .:: "
echo ".::        .::     .::  .::    .: .::    .::"
echo ".::::::::    .::::       .:::::     .:: ::  " 
echo "--------------------------------------------"
echo "Move old logs to an archive."
echo "--------------------------------------------"
                                            
LOGS="/var/log"
FOLDER="archive"
TIMESTAMP=$(date +"%Y-%m-%d_%H%M%S")

sudo mkdir -p $LOGS/$FOLDER/$TIMESTAMP
sudo find $LOGS -name "*.log" -mtime +7 -type f -exec mv {} $LOGS/$FOLDER \;

echo "Completed"