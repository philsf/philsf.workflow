# ************************************************************
# Script:   72_output_exploratory1_table.R
# Purpose:  Create the tables for the Exploratory Analysis 1
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

foot.exploratory.E1      <- NA_character_
foot.exploratory.E1.full <- NA_character_

# Main Table (Body) -------------------------------------------------------

# Create the focused table for the Body, showing only the exposure
tab.exploratory.E1 <- tab_adj(
  crude    = model.exploratory.E1.raw,
  adjusted = model.exploratory.E1.adj,
  include  = c("exposure"), # Only include the main exposure in the final table
  adjusted_for = "Age and Sex", # List variables suppressed from output
  footnote = foot.exploratory.E1,    # Footnote for main table
  exponentiate = exp.outcome.E1,
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote_header(
    footnote = NA_character_, # additional global footnote
    replace = FALSE,
  )

# Full Table (Appendix) ---------------------------------------------------

# Create the full table for the Appendix, including all variables
tab.exploratory.E1.full <- tab_adj(
  crude    = model.exploratory.E1.raw,
  adjusted = model.exploratory.E1.adj,
  include  = NULL, # Include all variables
  footnote = foot.exploratory.E1.full, # Footnote for full table
  exponentiate = exp.outcome.E1,
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote_header(
    footnote = NA_character_, # additional global footnote
    replace = FALSE,
  )
