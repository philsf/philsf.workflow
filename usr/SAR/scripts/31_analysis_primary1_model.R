# ************************************************************
# Script:   31_analysis_primary1_model.R
# Purpose:  Fit the primary 1 statistical model(s)
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

# 1. Primary Model (Unadjusted) -------------------------------------------
# Use the formula defined in 00_setup_global.R
# This is typically the raw or unadjusted model

model.primary.P1.raw <- glm(
  formula = formula.primary.P1.raw,
  # family = gaussian(link = "identity"), # Customize family/link as needed
  family = binomial(link = "logit"), # Customize family/link as needed
  data = data.primary1.ads,
)

# 2. Primary Model (Adjusted) ---------------------------------------------
# If an adjusted model is pre-specified in the SAP

model.primary.P1.adj <- glm(
  formula = formula.primary.P1.adj,
  family = binomial(link = "logit"), # Customize family/link as needed
  data = data.primary1.ads,
)

# NOTE: No gtsummary or plotting functions should be used here.
# These raw objects (model.primary.P1.raw, model.primary.P1.adj)
# will be formatted into final tables/figures in 32- and 33- scripts.

# 3. Model diagnostics ----------------------------------------------------

# CRITICAL CHECKS: Adjusted Model

# 1. Global Diagnostic Report (Requires library(performance) in 00-):
#    - For GLMs (logistic, Poisson), this uses appropriate residuals (e.g., Dunn-Smyth).
#    - For LMs (gaussian), this provides standard assumption checks.
model.primary.P1.adj %>% performance::check_model()
model.primary.P1.adj %>% performance::r2()

# # 2. Linear models
# # Normality of Residuals
# model.primary.P1.adj %>% performance::check_normality()
# model.primary.P1.adj %>% car::qqPlot()
# # Homoscedasticity (Variance Homogeneity)
# model.primary.P1.adj %>% car::ncvTest()

# # 2'. Logistic GLMs
# # Goodness-of-Fit (Calibration)
# model.primary.P1.adj%>% performance::check_hosmerlemeshow()
# # Discrimination / C-statistic/ ROC-AUC
# model.primary.P1.adj%>% performance::performance_auc()

# # 2''. Poisson vs Negative Binomial models
# model.primary.P1.raw %>% AER::dispersiontest()
# model.primary.P1.adj %>% AER::dispersiontest()

# 3. Collinearity Check
model.primary.P1.adj %>% car::vif()

# 4. Influence/Leverage/Outliers
model.primary.P1.adj %>% car::outlierTest()
model.primary.P1.adj %>% broom::augment() %>% slice_max(.cooksd, n = 5) # Highest influence / extreme response
model.primary.P1.adj %>% broom::augment() %>% slice_max(.hat,    n = 5) # Highest leverage  / extreme predictor

# 5. Model Comparison
anova(model.primary.P1.raw, model.primary.P1.adj)

# APPENDIX CHECKS: Full Diagnostics Plots (ggfortify)

# Full Diagnostic Plots (Good for Appendix/Internal QC)
# model.primary.P1.raw %>% autoplot()
# model.primary.P1.adj %>% autoplot()
