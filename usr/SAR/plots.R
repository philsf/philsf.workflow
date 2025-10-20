# 23_output_primary_plot.R

# Preamble ----------------------------------------------------------------
# Purpose: create the figures for the Primary Objective
# Use the gg base plot defined in 00-

# 1. Primary Outcome by exposure Figure (e.g., Figure 1) ------------------

gg.primary.outcome <- gg %>%
  # Start with the ggplot code from your old plots.R
  ggplot() +
  geom_density(aes(outcome, fill = exposure), alpha = .8) +
  # Apply themes/labels defined in 00_setup_global.R
  labs(
    x = lab.primary.outcome
    )

# 99. Age by Sex Figure (e.g., Figure A1) ---------------------------------

gg.appendix.age <- gg +
  aes(age, fill = sex) +
  geom_density(data = analytical, alpha = .9) +
  labs(
    x = attr(analytical$age, "label"),
    y = "Distribution density",
    fill = attr(analytical$sex, "label"),
  )

gg.age

# cool facet trick from https://stackoverflow.com/questions/3695497 by JWilliman
# gg +
#   geom_histogram(bins = 5, aes(outcome, y = ..count../tapply(..count.., ..PANEL.., sum)[..PANEL..]), fill = ff.col) +
#   scale_y_continuous(labels = scales::label_percent(accuracy = 1)) +
#   xlab(attr(analytical$outcome, "label")) +
#   ylab("") +
#   facet_wrap(~ exposure, ncol = 2)
