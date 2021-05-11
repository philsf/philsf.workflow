#!/bin/bash

AE=$1

if [[ "$1" == "" ]]
then
    AE=${PWD##*/} # local dir
fi

mkdir -p $AE
cd $AE
AE-basedirs.sh
AE-basefiles.sh
AE-init.sh
