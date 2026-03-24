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

# 1. Exploratory Inferential Table (e.g., Table 5 - Reduced) ----------------
# Uses the helper functions (tab, tab_adj) defined in 00_setup_global.R
tab.exploratory.E1 <- tab_adj(
  crude    = model.exploratory.E1.raw,
  adjusted = model.exploratory.E1.adj,
  include  = c("exposure"), # Only include the main exposure in the final table
  adjusted_for = "Age and Sex", # List variables suppressed from output
  footnote = foot.exploratory.E1,    # Footnote for main table
  exponentiate = exp.outcome.E1,
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote()

# 2. Full Exploratory Table (Appendix - Table A4) ---------------------------
# Create the full table for the Appendix, including all variables
tab.exploratory.E1.full <- tab_adj(
  crude    = model.exploratory.E1.raw,
  adjusted = model.exploratory.E1.adj,
  include  = NULL, # Include all variables
  footnote = foot.exploratory.E1.full, # Footnote for full table
  exponentiate = exp.outcome.E1,
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote()

# 3. Final Tables List ----------------------------------------------------

# # Update the list of all tables for easy reference later
# final.tables.list[["Table 5: Exploratory Inf"]] <- tab.exploratory.inf
# final.tables.list[["Table A4: Full Exploratory Inf"]] <- tab.exploratory.inf.full # NEW: Add the full table
