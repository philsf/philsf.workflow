# ============================================================
# Script:   32_output_primary_table.R
# Purpose:  Create the Primary Inferential Table (Table 2) by formatting
#           raw model objects from 31- [Multivariate Gig].
# Note:     Library Loading, Theme and Options and Global Functions and Labels
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

# 1. Primary Inferential Table (e.g., Table 2) ----------------------------

# Uses the helper functions (tab, tab_adj) defined in 00_setup_global.R
tab.primary.inf <- tab_adj(
  crude    = model.primary.raw,
  adjusted = model.primary.adj,
  include  = c("exposure"), # Example: Only include the main exposure in the final table
  # exp = FALSE, # Use the global 'exponentiate' variable defined in 00-
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  # modify_table_styling(columns = "label", align = "center") %>%
  # bold_labels() %>% # bolding is preferably done in the document template
  # modify_header(label ~ "...") %>%
  modify_footnote()


# 2. Full Table (Appendix) ------------------------------------------------

# Uses the helper functions (tab, tab_adj) defined in 00_setup_global.R
tab.primary.inf.full <- tab_adj(
  crude    = model.primary.raw,
  adjusted = model.primary.adj,
  include  = everything(), # Example: Full table for the Appendix
  # exp = FALSE, # Use the global 'exponentiate' variable defined in 00-
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  # modify_table_styling(columns = "label", align = "center") %>%
  # bold_labels() %>% # bolding is preferably done in the document template
  # modify_header(label ~ "...") %>%
  modify_footnote()

# 3. Final Tables List ----------------------------------------------------

# Update the list of all tables for easy reference later
# final.tables.list <- list(
#   "Table 1: Baseline"           = tab.primary.desc,
#   "Table 2: Primary Inference"  = tab.primary.inf,
#   "Table A1: Primary Inference" = tab.primary.inf.full
# )
final.tables.list[["Table 2: Primary Inference"]] <- tab.primary.inf
final.tables.list[["Table A1: Primary Inference"]] <- tab.primary.inf.full
