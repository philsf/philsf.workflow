#!/bin/bash

SAR=$1

if [[ "$1" == "" ]]
then
    SAR=${PWD##*/} # local dir
fi

mkdir -p "$SAR"
cd "$SAR"
AE-basedirs.sh
AE-basefiles.sh
AE-init.sh
