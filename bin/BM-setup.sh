#!/bin/bash

REMOTENAME=$1
REMOTES_DIR=$2

echo "Creating standard root"
mkdir -p Analises Documentos Comunicacao Relatorios

if [[ "$1" == "" ]]
then
    echo "Usage: BM-setup.sh REMOTE REMOTES_DIR"
    exit
fi

cd Analises

for SAR in "$REMOTES_DIR"/SAR-*
do
    echo -n "$REMOTENAME: "
    git clone --origin=$REMOTENAME "$SAR" > /dev/null
done

cd - > /dev/null
