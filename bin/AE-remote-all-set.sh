#!/bin/bash

REMOTENAME=$1
ANALISESDIR=$2

if [[ "$1" == "" ]]
then
    echo "Uso: AE-remote-all-set.sh remoto remotos_dir"
    exit
fi

for AE in AE-*
do
    cd "$AE"
    AE-remote-set.sh "$REMOTENAME" "$ANALISESDIR"
    cd - > /dev/null
done
