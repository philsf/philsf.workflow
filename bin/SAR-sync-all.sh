#!/bin/bash

DIRECTORIES=("$@")

for REPO in "${DIRECTORIES[@]}";
do echo -n "Entering $REPO ";
   cd "$REPO";
   SAR-sync.sh
   echo ""
   cd - >/dev/null;
done
