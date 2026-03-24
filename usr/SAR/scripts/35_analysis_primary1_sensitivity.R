# ************************************************************
# Script:   35_analysis_primary1_sensitivity.R
# Purpose:  Fit the Sensitivity 1 statistical model(s)
#
# Note:     N/A
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

data.primary1.sens.ads <- data.master.ads[-c(21, 41), ] # model.primary.P1.adj %>% performance::check_outliers(threshold = list(cook=.1))

# 1. Primary Model (Unadjusted) -------------------------------------------
# Use the formula defined in 00_setup_global.R
# This is typically the raw or unadjusted model

model.primary.P1.raw.sens <- glm(
  formula = formula.primary.P1.raw,
  family = binomial(link = "logit"),
  data = data.primary1.sens.ads,
)

# 2. Primary Model (Adjusted) ---------------------------------------------
# If an adjusted model is pre-specified in the SAP

model.primary.P1.adj.sens <- glm(
  formula = formula.primary.P1.adj,
  family = binomial(link = "logit"),
  data = data.primary1.sens.ads,
)

# NOTE: No gtsummary or plotting functions should be used here.
# These raw objects (model.primary.raw, model.primary.adj)
# will be formatted into final tables/figures in 36- script.
