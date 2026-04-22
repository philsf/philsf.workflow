#!/bin/bash

# ************************************************************
# Script:   philsf.workflow-uninstall.sh
# Purpose:  Remove all deployed files, including shell utilities, 
#           configuration files, and R workflow templates.
#
# Note:     N/A
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-11-11
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

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
README-SAR_en.md
README-SAR_pt.md
Portfolio_en.md
Portfolio_pt.md
QC-Checklist-1-Project-Setup.md
QC-Checklist-2-Scripts-Setup.md
QC-Checklist-3-SAP.md
QC-Checklist-4-Analysis.md
QC-Checklist-5-SAR.md
QC-Checklist-6-Project-Close-out.md
SAP_OBS_full_en.Rmd
SAP_OBS_full_pt.Rmd
SAP_OBS_simp_en.Rmd
SAR_en.Rmd
SAR_pt.Rmd
misc/
"

RSCRIPTS="
00_setup_global.R
01_data_mock.R
05_sample_size_calculation.R
06_output_table_shells.R
10_data_prep.R
15_imputation.R
20_data_baseline_ads.R
21_output_baseline_table.R
22_output_baseline_plot.R
30_data_primary1_ads.R
31_analysis_primary1_model.R
32_output_primary1_table.R
33_output_primary1_plot.R
34_output_primary_table_univar.R
35_analysis_primary1_sensitivity.R
36_output_primary1_sens_table.R
37_output_primary1_sens_plot.R
40_data_secondary1_ads.R
41_analysis_secondary1_model.R
42_output_secondary1_table.R
43_output_secondary1_plot.R
50_data_secondary2_ads.R
51_analysis_secondary2_model.R
52_output_secondary2_table.R
53_output_secondary2_plot.R
60_data_secondary3_ads.R
61_analysis_secondary3_model.R
62_output_secondary3_table.R
63_output_secondary3_plot.R
70_data_exploratory1_ads.R
71_analysis_exploratory1_model.R
72_output_exploratory1_table.R
73_output_exploratory1_plot.R
90_outputs_tables.R
91_outputs_plots.R
95_cache_results.R
96_load_cached_results.R
99_full_analysis_run.R
README-R.md
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
for f in $RSCRIPTS; do rm -f "$CFGDIR/scripts/$f"; done
for f in $LEGACY_RSCRIPTS; do rm -f "$CFGDIR/$f"; done
rmdir -p --ignore-fail-on-non-empty "$CFGDIR/scripts"
