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

sudo mkdir $LOGS/$FOLDER
sudo find $LOGS -name "*.log" -type f -exec gzip {} \;
sudo mv $LOGS/*.gz $LOGS/$FOLDER
sudo rm -rf "*.log"