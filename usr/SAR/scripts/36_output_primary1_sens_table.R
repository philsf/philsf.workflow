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

# 1. Primary Inferential Table (e.g., Table 3) ----------------------------
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

# 2. Full Table (Appendix) ------------------------------------------------
tab.primary.P1.full.sens <- tab_adj(
  crude    = model.primary.P1.raw.sens,
  adjusted = model.primary.P1.adj.sens,
  include  = NULL,                      # Example: Full table for the Appendix
  footnote = foot.primary.P1.full.sens, # Footnote for full table
  exponentiate = exp.outcome.P1,
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote()

# 3. Final Tables List ----------------------------------------------------

# Update the list of all tables for easy reference later
# final.tables.list[["Table 3: Sensitivity"]] <- tab.primary.P1.sens
# final.tables.list[["Table A2: Full Sensitivity"]] <- tab.primary.P1.full.sens
