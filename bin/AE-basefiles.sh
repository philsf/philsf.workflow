#!/bin/bash

AE=${PWD##*/} # local dir

RSCRIPTS="
input.R
describe.R
inference.R
modeling.R
plots.R
results.R
plots-save.R
README-R.md
"
cp ~/usr/AE/gitignore .gitignore
cp ~/usr/AE/new-rproj $AE.Rproj
for r in $RSCRIPTS; do cp ~/usr/AE/$r scripts/; done
mv scripts/README-R.md scripts/README.md
echo "# $AE" > README.md
