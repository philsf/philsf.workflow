#!/bin/bash

REMOTENAME=$1
REMOTES_DIR=$2

if [[ "$1" == "" ]]
then
    echo "Usage: SAR-remote-all-set.sh REMOTE REMOTES_DIR"
    exit
fi

for SAR in SAR-*
do
    cd "$SAR"
    SAR-remote-set.sh "$REMOTENAME" "$REMOTES_DIR"
    cd - > /dev/null
done
