#!/bin/bash

orig="yyyy-NNN-XX"
dest=$1

if [[ "$dest" == "" ]]
then
    echo "Usage: SAR-links.sh $orig"
    exit
fi

sed -i "s/$orig/$dest/g" README.md scripts/* report/*md 2>&1 >/dev/null
