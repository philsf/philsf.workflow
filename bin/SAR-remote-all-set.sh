#!/bin/bash

REMOTENAME=$1
SARDIR=$2

if [[ "$1" == "" ]]
then
    echo "Usage: SAR-remote-all-set.sh REMOTE REMOTES_DIR"
    exit
fi

for SAR in SAR-*
do
    cd "$SAR"
    SAR-remote-set.sh "$REMOTENAME" "$SARDIR"
    cd - > /dev/null
done
