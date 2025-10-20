# 99_full_analysis_run.R

# Preamble ----------------------------------------------------------------
# Purpose: Run all scripts for the current project scope and refresh the cache.
# This is the ONLY script you should manually run for a fresh analysis.

source("00_setup_global.R")
source("10_data_prep.R")
# source("15_imputation.R") # Optional: if needed

# ----------------- CHOOSE YOUR SERVICE GIG BELOW -----------------

# UNIVERSAL SCRIPTS
source("20_analysis_primary_desc.R") # Table 1 is always created
source("23_output_primary_plot.R")   # Plot is usually created

# MULTIVARIATE ANALYSIS GIG (Full Regression) - Uncomment these:
# source("21_analysis_primary_model.R") # Fits the models
# source("22_output_primary_table.R")   # Formats models into tab.primary.inf

# UNIVARIATE ANALYSIS GIG (Group Comparisons) - Uncomment these:
# source("24_output_primary_table_univar.R") # Creates tab.primary.inf using add_p/add_difference

# -----------------------------------------------------------------

# Caching (Always run last)
source("95_cache_results.R") # Run last to save all objects
