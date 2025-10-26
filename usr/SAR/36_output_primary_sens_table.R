# ============================================================
# Script:   36_output_primary_sens_table.R
# Purpose:  Create the Primary Sensitivity Inferential Table (Table 3)
#           by formatting raw model objects from 35- [Sensitivity Gig].
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

# 1. Primary Inferential Table (e.g., Table 3) ----------------------------
tab.primary.inf.sens <- tab_adj(
  crude    = model.primary.raw.sens,
  adjusted = model.primary.adj.sens,
  include  = c("exposure"), # Example: Only include the main exposure
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote()

# 2. Full Table (Appendix) ------------------------------------------------
tab.primary.inf.full.sens <- tab_adj(
  crude    = model.primary.raw.sens,
  adjusted = model.primary.adj.sens,
  include  = NULL, # Example: Full table for the Appendix
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  modify_footnote()

# 3. Final Tables List ----------------------------------------------------

# Update the list of all tables for easy reference later
final.tables.list[["Table 3: Sensitivity"]] <- tab.primary.inf.sens
final.tables.list[["Table A2: Full Sensitivity"]] <- tab.primary.inf.full.sens
