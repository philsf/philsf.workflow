#!/bin/bash

SAR=$1

if [[ "$1" == "" ]]
then
    SAR=${PWD##*/} # local dir
fi

mkdir -p "$SAR"
cd "$SAR"
SAR-basedirs.sh
SAR-basefiles.sh
SAR-init.sh
