# ============================================================
# Script:   42_output_secondary_table.R
# Purpose:  Create the secondary Inferential Table (Table 4) by formatting
#           raw model objects from 31_analysis_secondary_model.R
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

# 1. Secondary Inferential Table (e.g., Table 4 - Reduced) -----------------
# Uses the helper functions (tab, tab_adj) defined in 00_setup_global.R
tab.secondary.inf <- tab_adj(
  crude    = model.secondary.raw,
  adjusted = model.secondary.adj,
  include  = c("exposure"), # Only include the main exposure
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote()

# 2. Full Secondary Table (Appendix - Table A3) ---------------------------

# Create the full table for the Appendix, including all variables
tab.secondary.inf.full <- tab_adj(
  crude    = model.secondary.raw,
  adjusted = model.secondary.adj,
  include  = everything(), # Include all variables
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote()

# 3. Final Tables List ----------------------------------------------------

# Update the list of all tables for easy reference later
final.tables.list[["Table 4: Secondary Inf"]] <- tab.secondary.inf
final.tables.list[["Table A3: Full Secondary Inf"]] <- tab.secondary.inf.full
