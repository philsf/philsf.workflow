# 41_analysis_exploratory_model.R

# Preamble ----------------------------------------------------------------
# Purpose: Fit the exploratory statistical model(s) and save the raw model object.
# Note: might include subgroup analyses

# 1. exploratory Model (Unadjusted) -------------------------------------------
# Use the formula defined in 00_setup_global.R
# This is typically the raw or unadjusted model

model.exploratory.raw <- glm(
  formula = outcome ~ exposure,
  data = data.ads,
  family = gaussian(link = "identity") # Customize family/link as needed
)

# 2. exploratory Model (Adjusted) ---------------------------------------------
# If an adjusted model is pre-specified in the SAP

model.exploratory.adj <- glm(
  formula = model.exploratory.formula,
  data = data.ads,
  family = gaussian(link = "identity")
)

# NOTE: No gtsummary or plotting functions should be used here.
# These raw objects (model.exploratory.raw, model.exploratory.adj)
# will be formatted into final tables/figures in 22- and 23- scripts.
