# ============================================================
# Script:   35_analysis_primary_sensitivity.R
# Purpose:  Fit the primary statistical model(s) and save the raw model object.
#
# Note:     To be uncommented when used.
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

data.sens.ads <- data.master.ads # placeholder for template internal consistency

# 1. Primary Model (Unadjusted) -------------------------------------------
# Use the formula defined in 00_setup_global.R
# This is typically the raw or unadjusted model

model.primary.raw.sens <- glm(
  formula = formula.primary.raw,
  data = data.sens.ads,
  family = gaussian(link = "identity") # Customize family/link as needed
)

# 2. Primary Model (Adjusted) ---------------------------------------------
# If an adjusted model is pre-specified in the SAP

model.primary.adj.sens <- glm(
  formula = formula.primary.adj,
  data = data.sens.ads,
  family = gaussian(link = "identity")
)

# NOTE: No gtsummary or plotting functions should be used here.
# These raw objects (model.primary.raw, model.primary.adj)
# will be formatted into final tables/figures in 36- script.
