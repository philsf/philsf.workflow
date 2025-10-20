# 99_full_analysis_run.R

# Preamble ----------------------------------------------------------------
# Purpose: Run all scripts for the current project scope and refresh the cache.
# This is the ONLY script you should manually run for a fresh analysis.

# 1. Setup and Data Prep --------------------------------------------------
source("00_setup_global.R")
source("10_data_prep.R")
# source("15_imputation.R") # Optional: if needed

# 2. Primary Objective Analysis (2x- Series) ------------------------------

# UNIVERSAL SCRIPTS
source("20_analysis_primary_desc.R") # Table 1 is always created
source("23_output_primary_plot.R")   # Plot is usually created

# MULTIVARIATE ANALYSIS GIG (Full Regression) - ACTIVE
source("21_analysis_primary_model.R") # Fits the models
source("22_output_primary_table.R")   # Formats models into tab.primary.inf (Table 2 & A1)

# Sensitivity Analysis
# source("25_analysis_primary_sensitivity.R") # Fits sensitivity models (if active)
# source("26_output_primary_sens_table.R")    # Outputs sensitivity tables (if active)

# UNIVARIATE ANALYSIS GIG (Group Comparisons) - COMMENTED (Choose one gig)
# source("24_output_primary_table_univar.R")

# 3. Secondary & Exploratory Analysis (3x- and 4x- Series) ----------------

# Secondary
source("31_analysis_secondary_model.R")
source("32_output_secondary_table.R")    # Appends to final.tables.list

# Exploratory
source("41_analysis_exploratory_model.R")
source("42_output_exploratory_table.R")  # Appends to final.tables.list

# 4. Final Output Generation (9x- Series) ---------------------------------

# Caching (Always run last analysis step)
source("95_cache_results.R") # Run last to save all objects

# Output Rendering
# Uses 96_load_cached_results.R internally to load the saved objects
source("91_outputs_tables.R") # Renders final tables to Excel
source("90_outputs_plots.R")  # Renders final plots to PNGs

message("Full pipeline executed. All results cached and final outputs saved.")
