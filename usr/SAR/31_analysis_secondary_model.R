# 31_analysis_secondary_model.R

# Preamble ----------------------------------------------------------------
# Purpose: Fit the secondary statistical model(s) and save the raw model object.

# 1. secondary Model (Unadjusted) -------------------------------------------
# Use the formula defined in 00_setup_global.R
# This is typically the raw or unadjusted model

model.secondary.raw <- glm(
  formula = outcome ~ exposure,
  data = data.ads,
  family = gaussian(link = "identity") # Customize family/link as needed
)

# 2. secondary Model (Adjusted) ---------------------------------------------
# If an adjusted model is pre-specified in the SAP

model.secondary.adj <- glm(
  formula = model.secondary.formula,
  data = data.ads,
  family = gaussian(link = "identity")
)

# NOTE: No gtsummary or plotting functions should be used here.
# These raw objects (model.secondary.raw, model.secondary.adj)
# will be formatted into final tables/figures in 22- and 23- scripts.
