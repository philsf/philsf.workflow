#!/bin/bash

REMOTENAME=$1
SARDIR=$2

echo "Criando raiz padrão"
mkdir -p Analises Documentos Comunicacao Relatorios

if [[ "$1" == "" ]]
then
    echo "Uso: BM-setup.sh remoto remotos_dir"
    exit
fi

cd Analises

for SAR in "$SARDIR"/SAR-*
do
    echo -n "$REMOTENAME: "
    git clone --origin=$REMOTENAME "$SAR" > /dev/null
done

cd - > /dev/null
