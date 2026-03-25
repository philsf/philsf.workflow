# ************************************************************
# Script:   36_output_primary1_sens_table.R
# Purpose:  Create the tables for the Sensitivity Analysis
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

foot.primary.P1.sens      <- NA_character_
foot.primary.P1.full.sens <- NA_character_

# Main Table (Body) -------------------------------------------------------

# Create the focused table for the Body, showing only the exposure
tab.primary.P1.sens <- tab_adj(
  crude    = model.primary.P1.raw.sens,
  adjusted = model.primary.P1.adj.sens,
  include  = c("exposure"),        # Example: Only include the main exposure
  adjusted_for = "Age and Sex",    # List variables suppressed from output
  footnote = foot.primary.P1.sens, # Footnote for main table
  exponentiate = exp.outcome.P1,
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote()


# Full Table (Appendix) ---------------------------------------------------

# Create the full table for the Appendix, including all variables
tab.primary.P1.full.sens <- tab_adj(
  crude    = model.primary.P1.raw.sens,
  adjusted = model.primary.P1.adj.sens,
  include  = NULL,                      # Example: Full table for the Appendix
  footnote = foot.primary.P1.full.sens, # Footnote for full table
  exponentiate = exp.outcome.P1,
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote()
