# 33_output_secondary_plot.R

# Preamble ----------------------------------------------------------------
# Purpose: create the figures for the secondary Objective
# Use the gg.template base plot defined in 00-

# 1. secondary Outcome by exposure Figure (e.g., Figure 1) ------------------

gg.secondary.outcome <- data.ads %>%
  gg.template +
  geom_density(aes(outcome, fill = exposure), alpha = .8) +
  # Apply themes/labels defined in 00_setup_global.R
  labs(
    x = lab.secondary.outcome
  )

gg.secondary.outcome

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
