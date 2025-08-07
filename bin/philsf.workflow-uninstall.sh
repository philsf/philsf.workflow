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
SAR-links.sh
SAR-new.sh
SAR-remote-rename.sh
SAR-remote-set.sh
SAR-remote-set-github
SAR-remote-set-all.sh
SAR-rename.sh
SAR-sync.sh
SAR-sync-all.sh
philsf.workflow-uninstall.sh
BM-setup.sh
SAR-basedirs
SAR-basefiles
SAR-init
SAR-links
SAR-new
SAR-remote-rename
SAR-remote-set
SAR-remote-set-all
SAR-rename
SAR-sync
SAR-sync-all
"
CFG="
gitignore
new-rproj
SAP_en.Rmd
SAP_pt.Rmd
SAR_en.Rmd
SAR_pt.Rmd
misc/
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
README-SAR_en.md
README-SAR_pt.md
Portfolio_en.md
Portfolio_pt.md
"

echo "Removing files from $SCRIPTDIR"
for f in $SCRIPTS; do rm -f "$SCRIPTDIR/$f"; done
rmdir -p --ignore-fail-on-non-empty "$SCRIPTDIR"
echo "Removing files from $CFGDIR"
for f in $CFG; do rm -rf "$CFGDIR/$f"; done
for f in $RSCRIPTS; do rm -f "$CFGDIR/$f"; done
rmdir -p --ignore-fail-on-non-empty "$CFGDIR"
