# ============================================================
# Script:   91_outputs_plots.R
# Purpose:  Render and save final figures from cached objects.
#
# Note:     This script ASSUMES the cache has been created by running 99_full_analysis_run.R
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

# 1. Load Cached Results --------------------------------------------------

# ONLY load the cache if a key analysis object (like the descriptive table)
# is NOT found in the current environment. This prevents redundant re-loading
# when sourced by the full analysis script (99_full_analysis_run.R).
if (!exists("tab.primary.desc")) {
  source("scripts/96_load_cached_results.R")
}
# NOTE: If we run in Manual Mode, 96- will load tab.primary.desc,
# and the rest of the script will proceed normally.

# 2. Save Primary Figure(s) -----------------------------------------------

# Figure 1: Primary Outcome Density Plot (Always safe)
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

# Figure 2: Primary Model Prediction Plot (Only in Multivariate Gig)
if (exists("gg.primary.predict")) {
  ggsave(
    filename = "figures/Figure_2_Primary_Predict.png",
    plot   = gg.primary.predict,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

# 3. Save Secondary Figure(s) ---------------------------------------------

if (exists("gg.secondary.outcome")) {
  ggsave(
    filename = "figures/Figure_3_Secondary_Outcome.png",
    plot   = gg.secondary.outcome,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

if (exists("gg.secondary.predict")) {
  ggsave(
    filename = "figures/Figure_4_Secondary_Predict.png",
    plot   = gg.secondary.predict,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

# 4. Save Exploratory Figure(s) -------------------------------------------

if (exists("gg.exploratory.outcome")) {
  ggsave(
    filename = "figures/Figure_5_Exploratory_Outcome.png",
    plot   = gg.exploratory.outcome,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

if (exists("gg.exploratory.predict")) {
  ggsave(
    filename = "figures/Figure_6_Exploratory_Predict.png",
    plot   = gg.exploratory.predict,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

# 9. Save Appendix Figure(s) ----------------------------------------------

# Figure A1: Age by Sex (Always created in 23_output_primary_plot.R)
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
