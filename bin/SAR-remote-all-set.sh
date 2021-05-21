#!/bin/bash

REMOTENAME=$1
REMOTES_DIR=$2

if [[ "$2" == "" ]]
then
    echo "Usage: SAR-remote-all-set.sh REMOTE REMOTES_DIR [SAR_LIST]"
    exit
fi

# accept optional SAR_LIST as argument
shift 2
SAR_LIST=$@

if [[ "$@" == "" ]]
then
    SAR_LIST=*SAR*
fi

for SAR in $SAR_LIST
do
    cd "$SAR"
    SAR-remote-set.sh "$REMOTENAME" "$REMOTES_DIR"
    cd - > /dev/null
done
