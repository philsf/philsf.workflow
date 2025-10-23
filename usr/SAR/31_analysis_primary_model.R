# ============================================================
# Script:   31_analysis_primary_model.R
# Purpose:  Fit the primary statistical model(s) and save the raw model object.
# Note:     N/A
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

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

# CRITICAL CHECKS: Adjusted Model

# 1. Global Diagnostic Report (Requires library(performance) in 00-):
#    - For GLMs (logistic, Poisson), this uses appropriate residuals (e.g., Dunn-Smyth).
#    - For LMs (gaussian), this provides standard assumption checks.
model.primary.adj %>% performance::check_model()
model.primary.adj %>% performance::r2()

# # 2. Linear models
# # Normality of Residuals
# model.primary.adj %>% performance::check_normality()
# model.primary.adj %>% car::qqPlot()
# # Homoscedasticity (Variance Homogeneity)
# model.primary.adj %>% car::ncvTest()

# # 2'. Logistic GLMs
# # Goodness-of-Fit (Calibration)
# model.primary.adj%>% performance::check_hosmerlemeshow()
# # Discrimination / C-statistic/ ROC-AUC
# model.primary.adj%>% performance::performance_auc()

# # 2''. Poisson vs Negative Binomial models
# model.primary.raw %>% AER::dispersiontest()
# model.primary.adj %>% AER::dispersiontest()

# 3. Collinearity Check
model.primary.adj %>% car::vif()

# 4. Influence/Leverage/Outliers
model.primary.adj %>% car::outlierTest()
model.primary.adj %>% broom::augment() %>% slice_max(.cooksd, n = 5) # Highest influence / extreme response
model.primary.adj %>% broom::augment() %>% slice_max(.hat,    n = 5) # Highest leverage  / extreme predictor

# 5. Model Comparison
anova(model.primary.raw, model.primary.adj)

# APPENDIX CHECKS: Full Diagnostics Plots (ggfortify)

# Full Diagnostic Plots (Good for Appendix/Internal QC)
model.primary.raw %>% autoplot()
model.primary.adj %>% autoplot()
