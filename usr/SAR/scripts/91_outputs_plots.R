# ************************************************************
# Script:   91_outputs_plots.R
# Purpose:  Render and save final figures from cached objects.
#
# Note:     This script ASSUMES the cache has been created by running 99_full_analysis_run.R
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

# Primary Figures ---------------------------------------------------------

# Flowchart
if (exists("gg.cohort_flow")) {
  gg.cohort_flow %>%
    DiagrammeRsvg::export_svg() %>%
    charToRaw() %>%
    rsvg::rsvg_png(
      file = "04 outputs/Flowchart.png",
      height = 1200,
    )
}

# Primary Outcome Distribution Plot
if (exists("gg.primary.P1.outcome")) {
  ggsave(
    filename = "04 outputs/Primary1_Outcome.png",
    plot   = gg.primary.P1.outcome,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

# Primary Model Prediction Plot
if (exists("gg.primary.P1.predict")) {
  ggsave(
    filename = "04 outputs/Primary1_Predict.png",
    plot   = gg.primary.P1.predict,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

# Sensitivity Outcome Distribution Plot
if (exists("gg.primary.P1.outcome.sens")) {
  ggsave(
    filename = "04 outputs/Primary1_Outcome_Sens.png",
    plot   = gg.primary.P1.outcome.sens,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

# Sensitivity Model Prediction Plot
if (exists("gg.primary.P1.predict.sens")) {
  ggsave(
    filename = "04 outputs/Primary1_Predict_Sens.png",
    plot   = gg.primary.P1.predict.sens,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

# Secondary Figures -------------------------------------------------------

if (exists("gg.secondary.S1.outcome")) {
  ggsave(
    filename = "04 outputs/Secondary1_Outcome.png",
    plot   = gg.secondary.S1.outcome,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

if (exists("gg.secondary.S1.predict")) {
  ggsave(
    filename = "04 outputs/Secondary1_Predict.png",
    plot   = gg.secondary.S1.predict,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

if (exists("gg.secondary.S2.outcome")) {
  ggsave(
    filename = "04 outputs/Secondary2_Outcome.png",
    plot   = gg.secondary.S2.outcome,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

if (exists("gg.secondary.S2.predict")) {
  ggsave(
    filename = "04 outputs/Secondary2_Predict.png",
    plot   = gg.secondary.S2.predict,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

if (exists("gg.secondary.S3.outcome")) {
  ggsave(
    filename = "04 outputs/Secondary3_Outcome.png",
    plot   = gg.secondary.S3.outcome,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

if (exists("gg.secondary.S3.predict")) {
  ggsave(
    filename = "04 outputs/Secondary3_Predict.png",
    plot   = gg.secondary.S3.predict,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

# Exploratory Figures -----------------------------------------------------

if (exists("gg.exploratory.E1.outcome")) {
  ggsave(
    filename = "04 outputs/Exploratory1_Outcome.png",
    plot   = gg.exploratory.E1.outcome,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

if (exists("gg.exploratory.E1.predict")) {
  ggsave(
    filename = "04 outputs/Exploratory1_Predict.png",
    plot   = gg.exploratory.E1.predict,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}

# Appendix Figures --------------------------------------------------------

# Figure A1: Age by Sex (Always created in 23-)
if (exists("gg.appendix.age")) {
  ggsave(
    filename = "04 outputs/Age_by_Sex.png",
    plot   = gg.appendix.age,
    height = fig.height,
    width  = fig.width,
    units  = fig.units,
    dpi    = fig.dpi,
    device = fig.device
  )
}
