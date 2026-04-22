# ************************************************************
# Script:   99_full_analysis_run.R
# Purpose:  Run all scripts for the current project scope and refresh the cache.
#
# Note:     This is the ONLY script you should manually run for a fresh analysis.
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

# Setup and Data Prep -----------------------------------------------------

source("02 scripts/00_setup_global.R")
# source("02 scripts/01_data_mock.R")
source("02 scripts/10_data_prep.R")
# source("02 scripts/05_sample_size_calculation.R")  # Optional: if contracted
# source("02 scripts/06_output_table_shells.R")      # Optional: if contracted
# source("02 scripts/15_imputation.R")               # Optional: if contracted

# Primary Analysis (3x- Series) -------------------------------------------

# DESCRIPTIVE ANALYSIS
source("02 scripts/20_data_baseline_ads.R")
source("02 scripts/21_output_baseline_table.R") # Table 1 Baseline Characteristics
source("02 scripts/22_output_baseline_plot.R")

# MULTIVARIATE ANALYSIS GIG (Full Regression) - ACTIVE
source("02 scripts/30_data_primary1_ads.R")
source("02 scripts/31_analysis_primary1_model.R") # Fits the models
source("02 scripts/32_output_primary1_table.R")   # Tables from the models
source("02 scripts/33_output_primary1_plot.R")    # Plots from the models

# # Sensitivity Analysis
source("02 scripts/35_analysis_primary1_sensitivity.R")
source("02 scripts/36_output_primary1_sens_table.R")
source("02 scripts/37_output_primary1_sens_plot.R")

# UNIVARIATE ANALYSIS GIG (Group Comparisons) - COMMENTED (Choose one gig)
# source("02 scripts/34_output_primary_table_univar.R")

# Secondary Analyses (4x- to 6x- Series) ----------------------------------

# Secondaries - Optional: if contracted

source("02 scripts/40_data_secondary1_ads.R")
source("02 scripts/41_analysis_secondary1_model.R")
source("02 scripts/42_output_secondary1_table.R")
source("02 scripts/43_output_secondary1_plot.R")

source("02 scripts/50_data_secondary2_ads.R")
source("02 scripts/51_analysis_secondary2_model.R")
source("02 scripts/52_output_secondary2_table.R")
source("02 scripts/53_output_secondary2_plot.R")

source("02 scripts/60_data_secondary3_ads.R")
source("02 scripts/61_analysis_secondary3_model.R")
source("02 scripts/62_output_secondary3_table.R")
source("02 scripts/63_output_secondary3_plot.R")

# Exploratory Analyses (7x- Series) ---------------------------------------

source("02 scripts/70_data_exploratory1_ads.R")
source("02 scripts/71_analysis_exploratory1_model.R")
source("02 scripts/72_output_exploratory1_table.R")
source("02 scripts/73_output_exploratory1_plot.R")

# Pipeline (9x- Series) ---------------------------------------------------

# Caching (Always run last analysis step)
source("02 scripts/95_cache_results.R") # Run last to save all objects

# Output Rendering
# source("02 scripts/90_outputs_tables.R") # Renders final tables to Excel (only manual!)
source("02 scripts/91_outputs_plots.R")  # Renders final plots to PNGs

message("Full pipeline executed. All results cached and final outputs saved.")
