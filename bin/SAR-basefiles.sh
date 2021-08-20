#!/bin/bash

SAR=${PWD##*/} # local dir

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
cp ~/usr/SAR/new-rproj $SAR.Rproj
for r in $RSCRIPTS; do cp ~/usr/SAR/$r scripts/; done
mv scripts/README-R.md scripts/README.md
echo "# $SAR" > README.md

cp ~/usr/SAR/gitignore .gitignore
# offer opt-out of private dataset
echo "# dataset is private and cannot be publicly versioned
dataset/
" >> .gitignore
