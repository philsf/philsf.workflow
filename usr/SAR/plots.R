# setup -------------------------------------------------------------------
# library(ggplot2)
# library(survminer)

ff.col <- "steelblue" # good for single groups scale fill/color brewer
ff.pal <- "Paired"    # good for binary groups scale fill/color brewer

# Theme setting (less is more)
theme_set(
  theme_classic()
)
theme_update(
  legend.position = "top"
)

gg <- ggplot(analytical) +
  scale_color_brewer(palette = ff.pal) +
  scale_fill_brewer(palette = ff.pal)

# plots -------------------------------------------------------------------

gg.outcome <- gg +
  geom_density(aes(outcome, fill = group), alpha = .8) +
  xlab(attr(analytical$outcome, "label")) +
  ylab("")
