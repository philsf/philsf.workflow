#!/bin/bash

if [ `uname -s` != "Linux" ];
then
    HOME="$USERPROFILE"
fi

SCRIPTDIR=$HOME/bin
CFGDIR=$HOME/usr/SAR
SCRIPTS="
SAR-basedirs.sh
SAR-basefiles.sh
SAR-init.sh
SAR-new.sh
SAR-remote-rename.sh
SAR-remote-set.sh
SAR-remote-set-all.sh
SAR-rename.sh
SAR-sync.sh
SAR-sync-all.sh
philsf.workflow-uninstall.sh
BM-setup.sh
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

echo "Removing files from $SCRIPTDIR"
for f in $SCRIPTS; do rm -f "$SCRIPTDIR/$f"; done
rmdir -p --ignore-fail-on-non-empty "$SCRIPTDIR"
echo "Removing files from $CFGDIR"
for f in $CFG; do rm -f "$CFGDIR/$f"; done
for f in $RSCRIPTS; do rm -f "$CFGDIR/$f"; done
rmdir -p --ignore-fail-on-non-empty "$CFGDIR"
