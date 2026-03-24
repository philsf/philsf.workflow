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

# 1. Setup and Data Prep --------------------------------------------------
source("02 scripts/00_setup_global.R")
# source("02 scripts/01_data_mock.R")
source("02 scripts/10_data_prep.R")
# source("02 scripts/05_sample_size_calculation.R")  # Optional: if contracted
# source("02 scripts/06_output_table_shells.R")      # Optional: if contracted
# source("02 scripts/15_imputation.R")               # Optional: if contracted

# 2. Primary Objective Analysis (3x- Series) ------------------------------

# DESCRIPTIVE ANALYSIS
source("02 scripts/20_data_baseline_ads.R")     # optional: objective-specific ADS
source("02 scripts/21_output_baseline_table.R") # Table 1 is always created
source("02 scripts/22_output_baseline_plot.R")  # Plot is usually created

# MULTIVARIATE ANALYSIS GIG (Full Regression) - ACTIVE
source("02 scripts/30_data_primary1_ads.R")        # optional: objective-specific ADS
source("02 scripts/31_analysis_primary1_model.R") # Fits the models
source("02 scripts/32_output_primary1_table.R")   # Formats models into tab.primary1.inf (Table 2 & A1)
source("02 scripts/33_output_primary1_plot.R")    # Plots from the model

# # Sensitivity Analysis
# source("02 scripts/35_analysis_primary1_sensitivity.R") # Fits sensitivity models (if active)
# source("02 scripts/36_output_primary1_sens_table.R")    # Outputs sensitivity tables (if active)

# UNIVARIATE ANALYSIS GIG (Group Comparisons) - COMMENTED (Choose one gig)
# source("02 scripts/34_output_primary_table_univar.R")

# 3. Secondary & Exploratory Analysis (4x- to 7x- Series) ----------------

# Secondary - Optional: if contracted
source("02 scripts/40_data_secondary1_ads.R") # optional: objective-specific ADS
source("02 scripts/41_analysis_secondary1_model.R")
source("02 scripts/42_output_secondary1_table.R")    # Appends to final.tables.list
source("02 scripts/43_output_secondary1_plot.R")

# source("02 scripts/50_data_secondary2_ads.R") # optional: objective-specific ADS
# source("02 scripts/51_analysis_secondary2_model.R")
# source("02 scripts/52_output_secondary2_table.R")    # Appends to final.tables.list
# source("02 scripts/53_output_secondary2_plot.R")

# source("02 scripts/60_data_secondary3_ads.R") # optional: objective-specific ADS
# source("02 scripts/61_analysis_secondary3_model.R")
# source("02 scripts/62_output_secondary3_table.R")    # Appends to final.tables.list
# source("02 scripts/63_output_secondary3_plot.R")

# Exploratory - Optional: if contracted
# source("02 scripts/70_data_exploratory1_ads.R")     # optional: objective-specific ADS
# source("02 scripts/71_analysis_exploratory1_model.R")
# source("02 scripts/72_output_exploratory1_table.R")   # Appends to final.tables.list
# source("02 scripts/73_output_exploratory1_plot.R")

# 4. Final Output Generation (9x- Series) ---------------------------------

# Caching (Always run last analysis step)
source("02 scripts/95_cache_results.R") # Run last to save all objects

# Output Rendering
# Uses 96_load_cached_results.R internally to load the saved objects
source("02 scripts/90_outputs_tables.R") # Renders final tables to Excel
source("02 scripts/91_outputs_plots.R")  # Renders final plots to PNGs

message("Full pipeline executed. All results cached and final outputs saved.")
