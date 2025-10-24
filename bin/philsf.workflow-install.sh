#!/bin/bash

if [[ `uname -s` =~ MINGW ]];
then
    HOME="$USERPROFILE"
fi

SCRIPTDIR=$HOME/bin
CFGDIR=$HOME/usr/SAR
SCRIPTS="
SAR-basedirs
SAR-basefiles
SAR-init
SAR-links
SAR-new
SAR-remote-rename
SAR-remote-set
SAR-remote-set-github
SAR-remote-set-all
SAR-rename
SAR-sync
philsf.workflow-uninstall.sh
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
*.R
README-R.md
README-SAR_en.md
README-SAR_pt.md
Portfolio_en.md
Portfolio_pt.md
"

echo "Installing files into $SCRIPTDIR/"
echo "Installing files into $CFGDIR/"
mkdir -p "$SCRIPTDIR" "$CFGDIR"

for f in $SCRIPTS; do /bin/cp -a bin/$f "$SCRIPTDIR"; done
for f in $CFG; do /bin/cp -a usr/SAR/$f "$CFGDIR"; done
for f in $RSCRIPTS; do /bin/cp -a usr/SAR/$f "$CFGDIR"; done
