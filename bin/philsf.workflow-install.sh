#!/bin/bash

if [[ `uname -s` =~ MINGW ]];
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
SAR-remote-set-all.sh
SAR-rename.sh
SAR-sync.sh
SAR-sync-all.sh
philsf.workflow-uninstall.sh
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
README-SAR_en.md
README-SAR_pt.md
"

echo "Installing files into $SCRIPTDIR/"
echo "Installing files into $CFGDIR/"
mkdir -p "$SCRIPTDIR" "$CFGDIR"

for f in $SCRIPTS; do /bin/cp bin/$f "$SCRIPTDIR"; done
for f in $CFG; do /bin/cp usr/SAR/$f "$CFGDIR"; done
for f in $RSCRIPTS; do /bin/cp usr/SAR/$f "$CFGDIR"; done
