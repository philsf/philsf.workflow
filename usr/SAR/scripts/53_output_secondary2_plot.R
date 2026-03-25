# ************************************************************
# Script:   53_output_secondary2_plot.R
# Purpose:  Create the figures for the Secondary Objective 2
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

# Outcome by Exposure -----------------------------------------------------

gg.secondary.S2.outcome <- data.secondary2.ads %>%
  gg.template +

  # continuous
  aes(outcome.S2, fill = exposure) + xlab(lab.outcome.S2) + labs(fill = lab.exposure) +
  geom_density(alpha = .8) + ylab("Distribution density") +

  # # categorical
  # aes(exposure, fill = outcome.S2) + xlab(lab.exposure) + labs(fill = lab.outcome.S2) +
  # geom_bar(position = "fill") + ylab("Participants") +
  # scale_y_continuous(labels = scales::label_percent()) +

  labs(
    caption = paste0("N = ", style_number(nrow(data.secondary2.ads))),
  )

gg.secondary.S2.outcome

# Model Predictions -------------------------------------------------------

# Only create this model-based plot if the model object exists
if (exists("model.secondary.S2.adj")) {
  # This block will run in the Multivariate Gig but be skipped in the Univariate Gig
  gg.secondary.S2.predict <- model.secondary.S2.adj %>%
    effect_plot(
      outcome = "outcome.S2",
      exposure = "exposure"
    )
  gg.secondary.S2.predict
}

