#!/bin/bash

orig="yyyy-NNN-XX"
dest=$1

sed -i "s/$orig/$dest/g" README.md scripts/* report/*md 2>&1 >/dev/null
