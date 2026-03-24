# ************************************************************
# Script:   37_output_primary1_sens_plot.R
# Purpose:  Create the figures for the Sensitivity Analysis
#
# Note:     Use the gg.template base plot defined in 00-
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-11-14
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

# Model effects plot ------------------------------------------------------

# Only create this model-based plot if the model object exists
if (exists("model.primary.P1.adj.sens")) {
  # This block will run in the Multivariate Gig but be skipped in the Univariate Gig
  gg.primary.P1.sens.predict <- model.primary.P1.adj.sens %>%
    effect_plot(
      outcome = "outcome",
      exposure = "exposure"
    )
  gg.primary.P1.sens.predict
}
