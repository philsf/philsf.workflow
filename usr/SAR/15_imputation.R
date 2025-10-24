# ============================================================
# Script:   15_imputation.R
# Purpose:  Create multiply imputed datasets using MICE (or other methods).
#
# Note:     Only run this script if missing data imputation is pre-specified in the SAP.
# Prerequisites:
#     - library(mice) loaded in 00_setup_global.R
#     - Complete master ADS (data.master.ads) created by 10_data_prep.R
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

# 1. Missing Data Pattern Exploration ------------------------------------

# Visualize missingness
data.master.ads %>% naniar::vis_miss()
data.master.ads %>% naniar::gg_miss_var()

# Pattern analysis
data.master.ads %>% mice::md.pattern()

# 2. Multiple Imputation Setup --------------------------------------------

# Define imputation model
# Exclude ID and outcome variables from predictors if doing sensitivity
impute_vars <- data.master.ads %>%
  select(-id) %>%  # Never impute IDs
  names()

# MICE imputation (m=5 datasets, seed for reproducibility)
set.seed(42)
data.master.imp <- data.master.ads %>%
  mice::mice(
    m = 5,                    # Number of imputed datasets
    method = "pmm",           # Predictive mean matching (safe default)
    maxit = 20,               # Iterations
    printFlag = FALSE
  )

# 3. Diagnostics ----------------------------------------------------------

# Convergence check
plot(data.master.imp)

# Imputed values vs observed (should overlap well)
densityplot(data.master.imp)

# 4. Create Pooled Analysis Objects ---------------------------------------

# For PRIMARY analysis: Complete case (default)
# data.master.ads remains unchanged

# For SENSITIVITY analysis: Use imputed data
# Models in 25- will use mice::with() and pool()
# Example structure for 25_analysis_primary_sensitivity.R:
# model.primary.adj.sens <- with(data.master.imp,
#   glm(formula = model.primary.formula, family = gaussian))
# model.primary.adj.sens.pooled <- mice::pool(model.primary.adj.sens)

# 5. Export for Use in Analysis Scripts -----------------------------------

# Save the mids object for use in sensitivity analyses
write_rds(data.master.imp, "results/data.master.imp.rds")

message("Multiple imputation complete. Use data.master.imp in sensitivity scripts (25-series).")
