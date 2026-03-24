# ************************************************************
# Script:   32_output_primary1_table.R
# Purpose:  Create the tables for the Primary Objective 1
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

foot.primary.P1      <- NA_character_
foot.primary.P1.full <- NA_character_

# 1. Primary Analysis Table (e.g., Table 2) ----------------------------

# Uses the helper functions (tab, tab_adj) defined in 00_setup_global.R
tab.primary.P1 <- tab_adj(
  crude    = model.primary.P1.raw,
  adjusted = model.primary.P1.adj,
  include  = c("exposure"),      # Example: Only include the main exposure in the final table
  adjusted_for = "Age and Sex",  # List variables suppressed from output
  footnote = foot.primary.P1,    # Footnote for main table
  exponentiate = exp.outcome.P1, # exponentiate is set in 00-
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  # modify_table_styling(columns = "label", align = "center") %>%
  # bold_labels() %>% # bolding is preferably done in the document template
  # modify_header(label ~ "...") %>%
  modify_footnote_header(
    footnote = foot.primary.P1,
    replace = FALSE,
  )

# 2. Full Table (Appendix) ------------------------------------------------

# Uses the helper functions (tab, tab_adj) defined in 00_setup_global.R
tab.primary.P1.full <- tab_adj(
  crude    = model.primary.P1.raw,
  adjusted = model.primary.P1.adj,
  include  = NULL,                 # Full table for the Appendix
  footnote = foot.primary.P1.full, # Footnote for full table
  exponentiate = exp.outcome.P1,   # exponentiate is set in 00-
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  # modify_table_styling(columns = "label", align = "center") %>%
  # bold_labels() %>% # bolding is preferably done in the document template
  # modify_header(label ~ "...") %>%
  modify_footnote_header(
    footnote = foot.primary.P1.full,
    replace = FALSE,
  )

# 3. Final Tables List ----------------------------------------------------

# Update the list of all tables for easy reference later
# final.tables.list <- list(
#   "Table 1: Baseline"           = tab.primary.P1.desc,
#   "Table 2: Primary Inference"  = tab.primary.P1.inf,
#   "Table A1: Primary Inference" = tab.primary.P1.inf.full
# )
# final.tables.list[["Table 2: Primary Inference"]] <- tab.primary.P1.inf
# final.tables.list[["Table A1: Primary Inference"]] <- tab.primary.P1.inf.full
