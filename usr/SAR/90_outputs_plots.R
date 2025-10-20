# 90_outputs_plots.R

# Preamble ----------------------------------------------------------------
# Purpose: Render and save final figures from cached objects.
# NOTE: This script ASSUMES the cache has been created by running 99_full_analysis_run.R

# 1. Load Cached Results --------------------------------------------------
source("96_load_cached_results.R")

# 2. Save Primary Figure(s) -----------------------------------------------

if (exists("gg.primary.outcome")) {
  ggsave(
    filename = "figures/Figure_1_Primary_Outcome.png",
    plot   = gg.primary.outcome,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

if (exists("gg.appendix.age")) {
  ggsave(
    filename = "figures/Figure_A1_Age_by_Sex.png",
    plot   = gg.appendix.age,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}
