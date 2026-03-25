# ************************************************************
# Script:   63_output_secondary3_plot.R
# Purpose:  Create the figures for the Secondary Objective 3
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

gg.secondary.S3.outcome <- data.secondary3.ads %>%
  gg.template +

  # # continuous
  # aes(outcome.S3, fill = exposure) + xlab(lab.outcome.S3) + labs(fill = lab.exposure) +
  # geom_density(alpha = .8) + ylab("Distribution density") +

  # categorical
  aes(exposure, fill = outcome.S3) + xlab(lab.exposure) + labs(fill = lab.outcome.S3) +
  geom_bar(position = "fill") + ylab("Participants") +
  scale_y_continuous(labels = scales::label_percent()) +

  labs(
    caption = paste0("N = ", style_number(nrow(data.secondary3.ads))),
  )

gg.secondary.S3.outcome

# Model Predictions -------------------------------------------------------

# Only create this model-based plot if the model object exists
if (exists("model.secondary.S3.adj")) {
  # This block will run in the Multivariate Gig but be skipped in the Univariate Gig
  gg.secondary.S3.predict <- model.secondary.S3.adj %>%
    effect_plot(
      outcome = "outcome.S3",
      exposure = "exposure"
    )
  gg.secondary.S3.predict
}

