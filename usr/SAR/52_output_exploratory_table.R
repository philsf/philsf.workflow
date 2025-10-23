# ============================================================
# Script:   52_output_exploratory_table.R
# Purpose:  Create the exploratory Inferential Table (Table 5) by formatting
#           raw model objects from 51_analysis_exploratory_model.R
# Note:     N/A
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

# 1. Exploratory Inferential Table (e.g., Table 5 - Reduced) ----------------
# Uses the helper functions (tab, tab_adj) defined in 00_setup_global.R
tab.exploratory.inf <- tab_adj(
  crude    = model.exploratory.raw,
  adjusted = model.exploratory.adj,
  include  = c("exposure"), # Only include the main exposure in the final table
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote()

# 2. Full Exploratory Table (Appendix - Table A4) ---------------------------
# Create the full table for the Appendix, including all variables
tab.exploratory.inf.full <- tab_adj(
  crude    = model.exploratory.raw,
  adjusted = model.exploratory.adj,
  include  = everything(), # Include all variables
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote()

# 3. Final Tables List ----------------------------------------------------

# Update the list of all tables for easy reference later
final.tables.list[["Table 5: Exploratory Inf"]] <- tab.exploratory.inf
final.tables.list[["Table A4: Full Exploratory Inf"]] <- tab.exploratory.inf.full # NEW: Add the full table
