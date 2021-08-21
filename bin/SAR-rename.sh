#!/bin/bash

if [[ "$1" == "" ]]
then
    echo "Usage: SAR-rename.sh SAR_NEW"
    exit
fi

OLD_SAR=${PWD##*/} # local dir
NEW_SAR=$1

echo "Renaming $OLD_SAR to $NEW_SAR"
cd ..
error=$(mv "$OLD_SAR" "$NEW_SAR" 2>&1) || echo "Can't rename repository: $error"
cd "$NEW_SAR" || { echo "Can't enter repository"; exit 1; }
error=$(mv "$OLD_SAR.Rproj" "$NEW_SAR.Rproj" 2>&1) || echo "Can't rename RStudio Project: $error"

echo "Remotes available for updating/renaming:"
for REMOTE in $(git remote)
do
    # SAR-remote-rename.sh $NEW_SAR $REMOTE
    echo "$REMOTE: " $(git remote get-url $REMOTE)
done
