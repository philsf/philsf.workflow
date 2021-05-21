#!/bin/bash

if [[ "$2" == "" ]]
then
    echo "Usage: SAR-remote-set-all.sh REMOTE REMOTES_DIR [SAR_LIST]"
    exit
fi

REMOTENAME=$1
REMOTES_DIR=$2
shift 2

# accept optional SAR_LIST as argument
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
