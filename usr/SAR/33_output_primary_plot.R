# ============================================================
# Script:   33_output_primary_plot.R
# Purpose:  Create the figures for the Primary Objective
#
# Note:     Use the gg.template base plot defined in 00-
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

# 1. Primary Outcome by exposure Figure (e.g., Figure 1) ------------------

gg.primary.outcome <- data.ads %>%
  gg.template +
  geom_density(aes(outcome, fill = exposure), alpha = .8) +
  # Apply themes/labels defined in 00_setup_global.R
  labs(
    x = lab.primary.outcome
  )

gg.primary.outcome

# 2. Model effects plot ---------------------------------------------------

# Only create this model-based plot if the model object exists
if (exists("model.primary.adj")) {
  # This block will run in the Multivariate Gig but be skipped in the Univariate Gig
  gg.primary.predict <- model.primary.adj %>% effect_plot()
}

# 99. Age by Sex Figure (e.g., Figure A1) ---------------------------------

gg.appendix.age <- data.ads %>%
  gg.template +
  aes(age, fill = sex) +
  geom_density(alpha = .9) +
  labs(
    x = attr(data.ads$age, "label"),
    y = "Distribution density",
    fill = attr(data.ads$sex, "label"),
  )

gg.appendix.age

# cool facet trick from https://stackoverflow.com/questions/3695497 by JWilliman
# gg +
#   geom_histogram(bins = 5, aes(outcome, y = ..count../tapply(..count.., ..PANEL.., sum)[..PANEL..]), fill = ff.col) +
#   scale_y_continuous(labels = scales::label_percent(accuracy = 1)) +
#   xlab(attr(analytical$outcome, "label")) +
#   ylab("") +
#   facet_wrap(~ exposure, ncol = 2)
