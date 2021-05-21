#!/bin/bash

REMOTENAME=$1
SARDIR=$2

if [[ "$1" == "" ]]
then
    echo "Uso: AE-remote-all-set.sh remoto remotos_dir"
    exit
fi

for SAR in SAR-*
do
    cd "$SAR"
    AE-remote-set.sh "$REMOTENAME" "$SARDIR"
    cd - > /dev/null
done
