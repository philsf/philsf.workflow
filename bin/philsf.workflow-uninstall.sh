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
00_setup_global.R
05_sample_size_calculation.R
06_output_table_shells.R
10_data_prep.R
15_imputation.R
20_data_descriptive_ads.R
21_output_descriptive_table.R
22_output_descriptive_plot.R
30_data_primary_ads.R
31_analysis_primary_model.R
32_output_primary_table.R
33_output_primary_plot.R
34_output_primary_table_univar.R
35_analysis_primary_sensitivity.R
36_output_primary_sens_table.R
40_data_secondary_ads.R
41_analysis_secondary_model.R
42_output_secondary_table.R
43_output_secondary_plot.R
50_data_exploratory_ads.R
51_analysis_exploratory_model.R
52_output_exploratory_table.R
53_output_exploratory_plot.R
90_outputs_tables.R
91_outputs_plots.R
95_cache_results.R
96_load_cached_results.R
99_full_analysis_run.R
README-R.md
README-SAR_en.md
README-SAR_pt.md
Portfolio_en.md
Portfolio_pt.md
"

LEGACY_RSCRIPTS="
input.R
describe.R
inference.R
modeling.R
plots.R
results.R
plots-save.R
"

echo "Removing files from $SCRIPTDIR"
for f in $SCRIPTS; do rm -f "$SCRIPTDIR/$f"; done
rmdir -p --ignore-fail-on-non-empty "$SCRIPTDIR"

echo "Removing files from $CFGDIR"
for f in $CFG; do rm -rf "$CFGDIR/$f"; done
for f in $RSCRIPTS; do rm -f "$CFGDIR/$f"; done
for f in $LEGACY_RSCRIPTS; do rm -f "$CFGDIR/$f"; done
rmdir -p --ignore-fail-on-non-empty "$CFGDIR"
