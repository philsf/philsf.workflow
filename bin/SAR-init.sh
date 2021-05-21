#!/bin/bash

SAR=${PWD##*/} # local dir

echo "Initializing repository for $SAR"
git init >/dev/null
git add .gitignore README.md "$SAR.Rproj"
git commit -m "Initial commit" >/dev/null

