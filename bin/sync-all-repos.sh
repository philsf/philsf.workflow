#!/bin/bash

DIRECTORIES=("$@")

for REPO in "${DIRECTORIES[@]}";
do echo -n "Entering $REPO ";
   cd "$REPO";
   sync-repo.sh
   echo ""
   cd - >/dev/null;
done
