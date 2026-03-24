# ************************************************************
# Script:   33_output_primary1_plot.R
# Purpose:  Create the figures for the Primary Objective 1
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

# Outcome by Exposure --------------------------------------------------

gg.primary.P1.outcome <- data.primary1.ads %>%
  mutate(outcome.P1 = factor(outcome.P1)) %>%
  mutate(exposure = factor(exposure)) %>%
  gg.template() +

  # # continuous
  # aes(outcome.P1, fill = exposure) + xlab(lab.outcome.P1) + labs(fill = lab.exposure) +
  # geom_density(alpha = .8) + ylab("Distribution density") +

  # categorical
  aes(exposure, fill = outcome.P1) + xlab(lab.exposure) + labs(fill = lab.outcome.P1) +
  geom_bar(position = "fill") + ylab("Participants") +
  scale_y_continuous(labels = scales::label_percent()) +

  labs(
    caption = paste0("N = ", style_number(nrow(data.primary1.ads))),
  )

gg.primary.P1.outcome

# Model effects plot ------------------------------------------------------

# Only create this model-based plot if the model object exists
if (exists("model.primary.P1.adj")) {
  # This block will run in the Multivariate Gig but be skipped in the Univariate Gig
  gg.primary.P1.predict <- model.primary.P1.adj %>%
    effect_plot(
      outcome = "outcome.P1",
      exposure = "exposure",
    )
  gg.primary.P1.predict
}

