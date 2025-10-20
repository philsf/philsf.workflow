# 21_analysis_primary_model.R

# Preamble ----------------------------------------------------------------
# Purpose: Fit the primary statistical model(s) and save the raw model object.

# 1. Primary Model (Unadjusted) -------------------------------------------
# Use the formula defined in 00_setup_global.R
# This is typically the raw or unadjusted model

model.primary.obj.raw <- glm(
  formula = outcome ~ exposure,
  data = data.ads,
  family = gaussian(link = "identity") # Customize family/link as needed
)

# 2. Primary Model (Adjusted) ---------------------------------------------
# If an adjusted model is pre-specified in the SAP

model.primary.obj.adj <- glm(
  formula = model.primary.formula,
  data = data.ads,
  family = gaussian(link = "identity")
)

# NOTE: No gtsummary or plotting functions should be used here.
# These raw objects (model.primary.raw.obj, model.primary.adj.obj)
# will be formatted into final tables/figures in 22- and 23- scripts.

# 3. Save model objects ---------------------------------------------------

model.primary.obj.raw %>% write_rds("model.primary.obj.raw")
model.primary.obj.adj %>% write_rds("model.primary.obj.adj")
