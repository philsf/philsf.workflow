# ************************************************************
# Script:   73_output_exploratory1_plot.R
# Purpose:  Create the figures for the Exploratory Analysis 1
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

# survival::survfit(Surv(time.E1, outcome.E1)~1, data.mock.ads) %>% ggsurvfit::ggsurvfit(theme = theme_ff(), col = ff.col)
# survival::survfit(Surv(time.E1, outcome.E1)~strata(sex), data.mock.ads) %>% ggsurvfit::ggsurvfit(theme = theme_ff(), col = ff.col)

gg.exploratory.E1.outcome <- data.exploratory1.ads %>%
  mutate(outcome.E1 = factor(outcome.E1)) %>%
  gg.template() +

  # # continuous
  # aes(outcome.E1, fill = exposure) + xlab(lab.outcome.E1) + labs(fill = lab.exposure) +
  # geom_density(alpha = .8) + ylab("Distribution density") +

  # categorical
  aes(exposure, fill = outcome.E1) + xlab(lab.exposure) + labs(fill = lab.outcome.E1) +
  geom_bar(position = "fill") + ylab("Participants") +
  scale_y_continuous(labels = scales::label_percent()) +

  labs(
    caption = paste0("N = ", style_number(nrow(data.exploratory1.ads))),
  )

gg.exploratory.E1.outcome

# Model Predictions -------------------------------------------------------

# Only create this model-based plot if the model object exists
if (exists("model.exploratory.E1.adj")) {
  # This block will run in the Multivariate Gig but be skipped in the Univariate Gig
  gg.exploratory.E1.predict <- model.exploratory.E1.adj %>%
    effect_plot(
      outcome = "outcome.E1",
      exposure = "exposure",
    )
  gg.exploratory.E1.predict
}
