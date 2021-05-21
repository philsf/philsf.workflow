#!/bin/bash

AE=${PWD##*/} # local dir

echo "Initializing repository for $AE"
git init >/dev/null
git add .gitignore README.md "$AE.Rproj"
git commit -m "Initial commit" >/dev/null

