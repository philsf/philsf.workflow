# ************************************************************
# Script:   62_output_secondary3_table.R
# Purpose:  Create the tables for the Secondary Objective 3
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

foot.secondary.S3      <- NA_character_
foot.secondary.S3.full <- NA_character_

# Main Table (Body) -------------------------------------------------------

# Create the focused table for the Body, showing only the exposure
tab.secondary.S3 <- tab_adj(
  crude    = model.secondary.S3.raw,
  adjusted = model.secondary.S3.adj,
  include  = c("exposure"),     # Only include the main exposure
  adjusted_for = "Age and Sex", # List variables suppressed from output
  footnote = foot.secondary.S3,    # Footnote for main table
  exponentiate = exp.outcome.S3,
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote()

tab.secondary.S3

# Full Table (Appendix) ---------------------------------------------------

# Create the full table for the Appendix, including all variables
tab.secondary.S3.full <- tab_adj(
  crude    = model.secondary.S3.raw,
  adjusted = model.secondary.S3.adj,
  include  = NULL, # Include all variables
  footnote = foot.secondary.S3.full, # Footnote for full table
  exponentiate = exp.outcome.S3,
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote()

tab.secondary.S3.full
