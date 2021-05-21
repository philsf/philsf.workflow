#!/bin/bash

if [[ "$1" == "" ]]
then
    echo "Uso: AE-remote-set.sh remoto remoto_dir"
    exit
fi

AE=${PWD##*/} # local dir
REMOTENAME=$1
REMOTEDIR=$2

OLDPWD=$PWD

if [ ! -d "$REMOTEDIR/$AE.git" ]; then
    echo "Creating remote point: $REMOTEDIR/$AE.git as bare repository"
    mkdir -p "$REMOTEDIR"
    cd "$REMOTEDIR"
    git clone --bare "$OLDPWD" >/dev/null 2>&1 | egrep -v "Cloning into bare repository|done."
    cd "$OLDPWD"
fi

echo "Setting remote $REMOTENAME into $REMOTEDIR/$AE.git"
git remote add "$REMOTENAME" . 2> /dev/null
git remote set-url "$REMOTENAME" "$REMOTEDIR"/$AE.git

