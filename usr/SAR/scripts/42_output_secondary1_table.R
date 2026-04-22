# ************************************************************
# Script:   42_output_secondary_table.R
# Purpose:  Create the tables for the Secondary Objective 1
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

foot.secondary.S1      <- NA_character_
foot.secondary.S1.full <- NA_character_

# Main Table (Body) -------------------------------------------------------

# Create the focused table for the Body, showing only the exposure
tab.secondary.S1 <- tab_adj(
  crude    = model.secondary.S1.raw,
  adjusted = model.secondary.S1.adj,
  include  = c("exposure"),     # Only include the main exposure
  adjusted_for = "Age and Sex", # List variables suppressed from output
  footnote = foot.secondary.S1,    # Footnote for main table
  exponentiate = exp.outcome.S1,
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote_header(
    footnote = NA_character_, # additional global footnote
    replace = FALSE,
  )

tab.secondary.S1

# Full Table (Appendix) ---------------------------------------------------

# Create the full table for the Appendix, including all variables
tab.secondary.S1.full <- tab_adj(
  crude    = model.secondary.S1.raw,
  adjusted = model.secondary.S1.adj,
  include  = NULL, # Include all variables
  footnote = foot.secondary.S1.full, # Footnote for full table
  exponentiate = exp.outcome.S1,
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote_header(
    footnote = NA_character_, # additional global footnote
    replace = FALSE,
  )


tab.secondary.S1.full
