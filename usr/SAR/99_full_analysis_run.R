# ============================================================
# Script:   99_full_analysis_run.R
# Purpose:  Run all scripts for the current project scope and refresh the cache.
#
# Note:     This is the ONLY script you should manually run for a fresh analysis.
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

# 1. Setup and Data Prep --------------------------------------------------
source("scripts/00_setup_global.R")
source("scripts/10_data_prep.R")
# source("scripts/05_sample_size_calculation.R")  # Optional: if contracted
# source("scripts/06_output_table_shells.R")      # Optional: if contracted
# source("scripts/15_imputation.R")               # Optional: if contracted

# 2. Primary Objective Analysis (3x- Series) ------------------------------

# DESCRIPTIVE ANALYSIS
# source("scripts/20_data_descriptive_ads.R")   # optional: objective-specific ADS
source("scripts/21_output_descriptive_table.R") # Table 1 is always created
source("scripts/22_output_descriptive_plot.R")  # Plot is usually created

# MULTIVARIATE ANALYSIS GIG (Full Regression) - ACTIVE
# source("scripts/30_data_primary_ads.R")     # optional: objective-specific ADS
source("scripts/31_analysis_primary_model.R") # Fits the models
source("scripts/32_output_primary_table.R")   # Formats models into tab.primary.inf (Table 2 & A1)
source("scripts/33_output_primary_plot.R")    # Plots from the model

# Sensitivity Analysis
# source("scripts/35_analysis_primary_sensitivity.R") # Fits sensitivity models (if active)
# source("scripts/36_output_primary_sens_table.R")    # Outputs sensitivity tables (if active)

# UNIVARIATE ANALYSIS GIG (Group Comparisons) - COMMENTED (Choose one gig)
# source("scripts/34_output_primary_table_univar.R")

# 3. Secondary & Exploratory Analysis (4x- and 5x- Series) ----------------

# Secondary - Optional: if contracted
# # source("scripts/40_data_secondary_ads.R") # optional: objective-specific ADS
# source("scripts/41_analysis_secondary_model.R")
# source("scripts/42_output_secondary_table.R")    # Appends to final.tables.list
# source("scripts/43_output_secondary_plot.R")

# Exploratory - Optional: if contracted
# # source("scripts/50_data_exploratory_ads.R")     # optional: objective-specific ADS
# source("scripts/51_analysis_exploratory_model.R")
# source("scripts/52_output_exploratory_table.R")   # Appends to final.tables.list
# source("scripts/53_output_exploratory_plot.R")

# 4. Final Output Generation (9x- Series) ---------------------------------

# Caching (Always run last analysis step)
source("scripts/95_cache_results.R") # Run last to save all objects

# Output Rendering
# Uses 96_load_cached_results.R internally to load the saved objects
source("scripts/90_outputs_tables.R") # Renders final tables to Excel
source("scripts/91_outputs_plots.R")  # Renders final plots to PNGs

message("Full pipeline executed. All results cached and final outputs saved.")
