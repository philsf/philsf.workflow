# ============================================================
# Script:   51_analysis_exploratory_model.R
# Purpose:  Fit the exploratory statistical model(s) and save the raw model object.
#
# Note:     May be used to include subgroup analyses.
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

# 1. Exploratory Model (Unadjusted) -------------------------------------------
# Use the formula defined in 00_setup_global.R
# This is typically the raw or unadjusted model

model.exploratory.raw <- glm(
  formula = outcome ~ exposure,
  data = data.master.ads,
  family = gaussian(link = "identity") # Customize family/link as needed
)

# 2. Exploratory Model (Adjusted) ---------------------------------------------
# If an adjusted model is pre-specified in the SAP

model.exploratory.adj <- glm(
  formula = model.exploratory.formula,
  data = data.master.ads,
  family = gaussian(link = "identity")
)

# NOTE: No gtsummary or plotting functions should be used here.
# These raw objects (model.exploratory.raw, model.exploratory.adj)
# will be formatted into final tables/figures in 22- and 23- scripts.

# 3. Model diagnostics ----------------------------------------------------

# CRITICAL CHECKS: Adjusted Model

# 1. Global Diagnostic Report (Requires library(performance) in 00-):
#    - For GLMs (logistic, Poisson), this uses appropriate residuals (e.g., Dunn-Smyth).
#    - For LMs (gaussian), this provides standard assumption checks.
model.exploratory.adj %>% performance::check_model()
model.exploratory.adj %>% performance::r2()

# # 2. Linear models
# # Normality of Residuals
# model.exploratory.adj %>% performance::check_normality()
# model.exploratory.adj %>% car::qqPlot()
# # Homoscedasticity (Variance Homogeneity)
# model.exploratory.adj %>% car::ncvTest()

# # 2'. Logistic GLMs
# # Goodness-of-Fit (Calibration)
# model.exploratory.adj%>% performance::check_hosmerlemeshow()
# # Discrimination / C-statistic/ ROC-AUC
# model.exploratory.adj%>% performance::performance_auc()

# # 2''. Poisson vs Negative Binomial models
# model.exploratory.raw %>% AER::dispersiontest()
# model.exploratory.adj %>% AER::dispersiontest()

# 3. Collinearity Check
model.exploratory.adj %>% car::vif()

# 4. Influence/Leverage/Outliers
model.exploratory.adj %>% car::outlierTest()
model.exploratory.adj %>% broom::augment() %>% slice_max(.cooksd, n = 5) # Highest influence / extreme response
model.exploratory.adj %>% broom::augment() %>% slice_max(.hat,    n = 5) # Highest leverage  / extreme predictor

# 5. Model Comparison
anova(model.exploratory.raw, model.exploratory.adj)

# APPENDIX CHECKS: Full Diagnostics Plots (ggfortify)

# Full Diagnostic Plots (Good for Appendix/Internal QC)
model.exploratory.raw %>% autoplot()
model.exploratory.adj %>% autoplot()
