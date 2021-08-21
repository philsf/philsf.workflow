#!/bin/bash

SAR=${PWD##*/} # local dir

echo "Initializing repository: $SAR"
git init >/dev/null
git add .gitignore README.md "$SAR.Rproj"
git commit -m "Initial commit" >/dev/null

echo "Client dataset made private (opt-out?)"
echo "# dataset is private and cannot be publicly versioned
dataset/" >> .gitignore

echo "README (en) applied over default (opt-out?)"
cp ~/usr/SAR/README_SAR_en.md README.md
