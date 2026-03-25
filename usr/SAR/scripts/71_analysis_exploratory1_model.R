# ************************************************************
# Script:   71_analysis_exploratory1_model.R
# Purpose:  Fit the Exploratory 1 statistical model(s)
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

# survival::coxph(Surv(time.E1, outcome.E1))
model.exploratory.E1.raw <- glm(
  formula = formula.exploratory.E1.raw,
  family = poisson(),
  data = data.exploratory1.ads,
)

# Adjusted Model ----------------------------------------------------------

model.exploratory.E1.adj <- glm(
  formula = formula.exploratory.E1.adj,
  family = poisson(),
  data = data.exploratory1.ads,
)

# NOTE: No gtsummary or plotting functions should be used here.
# These raw objects (model.exploratory.E1.raw, model.exploratory.E1.adj)
# will be formatted into final tables/figures in 52- and 53- scripts.

# Model diagnostics -------------------------------------------------------

# CRITICAL CHECKS: Adjusted Model

# # 1. Global Diagnostic Report (Requires library(performance) in 00-):
# #    - For GLMs (logistic, Poisson), this uses appropriate residuals (e.g., Dunn-Smyth).
# #    - For LMs (gaussian), this provides standard assumption checks.
# model.exploratory.E1.adj %>% performance::check_model()
model.exploratory.E1.adj %>% performance::r2()

# # 2. Linear models
# # Normality of Residuals
# model.exploratory.E1.adj %>% performance::check_normality()
# model.exploratory.E1.adj %>% car::qqPlot()
# # Homoscedasticity (Variance Homogeneity)
# model.exploratory.E1.adj %>% car::ncvTest()

# # 2'. Logistic GLMs
# # Goodness-of-Fit (Calibration)
# model.exploratory.E1.adj%>% performance::performance_hosmer()
# # Discrimination / C-statistic/ ROC-AUC
# model.exploratory.E1.adj%>% performance::performance_roc()

# 2''. Poisson vs Negative Binomial models
model.exploratory.E1.raw %>% AER::dispersiontest()
model.exploratory.E1.adj %>% AER::dispersiontest()

# # 3. Collinearity Check
model.exploratory.E1.adj %>% car::vif()

# # 4. Influence/Leverage/Outliers
# model.exploratory.E1.adj %>% car::outlierTest()
# model.exploratory.E1.adj %>% broom::augment() %>% slice_max(.cooksd, n = 5) # Highest influence / extreme response
# model.exploratory.E1.adj %>% broom::augment() %>% slice_max(.hat,    n = 5) # Highest leverage  / extreme predictor

# # 5. Model Comparison
# anova(model.exploratory.E1.raw, model.exploratory.E1.adj)

# APPENDIX CHECKS: Full Diagnostics Plots (ggfortify)

# # Full Diagnostic Plots (Good for Appendix/Internal QC)
# model.exploratory.E1.raw %>% autoplot()
# model.exploratory.E1.adj %>% autoplot()
