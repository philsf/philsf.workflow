# 21_analysis_primary_model.R

# Preamble ----------------------------------------------------------------
# Purpose: Fit the primary statistical model(s) and save the raw model object.

# 1. Primary Model (Unadjusted) -------------------------------------------
# Use the formula defined in 00_setup_global.R
# This is typically the raw or unadjusted model

model.primary.raw <- glm(
  formula = outcome ~ exposure,
  data = data.ads,
  family = gaussian(link = "identity") # Customize family/link as needed
)

# 2. Primary Model (Adjusted) ---------------------------------------------
# If an adjusted model is pre-specified in the SAP

model.primary.adj <- glm(
  formula = model.primary.formula,
  data = data.ads,
  family = gaussian(link = "identity")
)

# NOTE: No gtsummary or plotting functions should be used here.
# These raw objects (model.primary.raw, model.primary.adj)
# will be formatted into final tables/figures in 22- and 23- scripts.

# 3. Model diagnostics ----------------------------------------------------

# Not applicable to
model.primary.raw %>% resid() %>% shapiro.test()
model.primary.adj %>% resid() %>% shapiro.test()

model.primary.raw %>% augment() %>% slice_max(.cooksd, n = 5)
# model.primary.raw %>% augment() %>% slice_min(.cooksd, n = 5)
model.primary.raw %>% augment() %>% slice_max(.hat, n = 5)
# model.primary.raw %>% augment() %>% slice_min(.hat, n = 5)

model.primary.raw %>% autoplot()
model.primary.raw %>% autoplot()

anova(model.primary.raw, model.primary.adj)

# model.primary.raw %>% car::vif() # univariate model does not have a VIF
model.primary.adj %>% car::vif()

# # Poisson models
# model.primary.raw %>% AER::dispersiontest()
# model.primary.adj %>% AER::dispersiontest()
