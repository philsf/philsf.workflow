#!/bin/bash

if [ `uname -s` != "Linux" ];
then
    HOME="$USERPROFILE"
fi

SCRIPTDIR=$HOME/bin
CFGDIR=$HOME/usr/AE
SCRIPTS="
AE-basedirs.sh
AE-basefiles.sh
AE-init.sh
AE-new.sh
AE-remote-all-set.sh
AE-remote-rename.sh
AE-remote-set.sh
AE-rename.sh
BM-setup.sh
BM-uninstall.sh
sync-all-repos.sh
sync-repo.sh
"
CFG="
gitignore
new-rproj
"
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

echo "Installing files into $SCRIPTDIR/"
echo "Installing files into $CFGDIR/"
mkdir -p "$SCRIPTDIR" "$CFGDIR"

for f in $SCRIPTS; do /bin/cp bin/$f "$SCRIPTDIR"; done
for f in $CFG; do /bin/cp usr/AE/$f "$CFGDIR"; done
for f in $RSCRIPTS; do /bin/cp usr/AE/$f "$CFGDIR"; done
