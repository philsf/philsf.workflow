# ************************************************************
# Script:   21_output_baseline_table.R
# Purpose:  Create the Participant Characteristics table (e.g., Table 1).
#
# Note:     N/A
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-11-14
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

foot.baseline <- NA_character_

# Main Table (Body) -------------------------------------------------------

tab.baseline <- data.baseline.ads %>%
  # Start with your existing table logic from describe.R
  tbl_summary(
    include = -id,
    by = exposure, # Comment for single-arm study, and remove add_overall()
    missing_text = "Missing",
    missing_stat = "{N_miss} ({p_miss}%)",
  ) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  # modify_table_styling(columns = "label", align = "center") %>%
  # bold_labels() %>% # bolding is preferably done in the document template
  # modify_header(label ~ "...") %>%
  add_overall() %>%
  modify_footnote_header(
    footnote = foot.baseline,
    replace = FALSE,
  )

# Full Table (Annex) ------------------------------------------------------

# Full EDA table to be sent to the client
# gtsummary::theme_gtsummary_eda()
