# ************************************************************
# Script:   41_analysis_secondary_model.R
# Purpose:  Fit the secondary 1 statistical model(s)
#
# Note:     May be used to include subgroup analyses.
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

# Unadjusted Model --------------------------------------------------------

model.secondary.S1.raw <- glm(
  formula = formula.secondary.S1.raw,
  family = binomial(link = "logit"), # Customize family/link as needed
  data = data.secondary1.ads,
)

# Adjusted Model ----------------------------------------------------------

model.secondary.S1.adj <- glm(
  formula = formula.secondary.S1.adj,
  family = binomial(link = "logit"),
  data = data.secondary1.ads,
)

# NOTE: No gtsummary or plotting functions should be used here.
# These raw objects (model.secondary.S1.raw, model.secondary.S1.adj)
# will be formatted into final tables/figures in 42- and 43- scripts.

# Model diagnostics -------------------------------------------------------

# CRITICAL CHECKS: Adjusted Model

# # 1. Global Diagnostic Report (Requires library(performance) in 00-):
# #    - For GLMs (logistic, Poisson), this uses appropriate residuals (e.g., Dunn-Smyth).
# #    - For LMs (gaussian), this provides standard assumption checks.
# model.secondary.S1.adj %>% performance::check_model()
model.secondary.S1.adj %>% performance::r2()

# # 2. Linear models
# # Normality of Residuals
# model.secondary.S1.adj %>% performance::check_normality()
# model.secondary.S1.adj %>% car::qqPlot()
# # Homoscedasticity (Variance Homogeneity)
# model.secondary.S1.adj %>% car::ncvTest()

# # 2'. Logistic GLMs
# # Goodness-of-Fit (Calibration)
# model.secondary.S1.adj%>% performance::performance_hosmer()
# # Discrimination / C-statistic/ ROC-AUC
# model.secondary.S1.adj%>% performance::performance_roc()

# # 2''. Poisson vs Negative Binomial models
# model.secondary.S1.raw %>% AER::dispersiontest()
# model.secondary.S1.adj %>% AER::dispersiontest()

# # 3. Collinearity Check
model.secondary.S1.adj %>% car::vif()

# # 4. Influence/Leverage/Outliers
# model.secondary.S1.adj %>% car::outlierTest()
model.secondary.S1.adj %>% broom::augment() %>% slice_max(.cooksd, n = 5) # Highest influence / extreme response
model.secondary.S1.adj %>% broom::augment() %>% slice_max(.hat,    n = 5) # Highest leverage  / extreme predictor

# 5. Model Comparison
anova(model.secondary.S1.raw, model.secondary.S1.adj)

# APPENDIX CHECKS: Full Diagnostics Plots (ggfortify)

# Full Diagnostic Plots (Good for Appendix/Internal QC)
# model.secondary.S1.raw %>% autoplot()
# model.secondary.S1.adj %>% autoplot()
