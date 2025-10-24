# ============================================================
# Script:   21_output_descriptive_table.R
# Purpose:  Create the primary descriptive table (e.g., Table 1).
#
# Note:     Uses the master ADS (data.master.ads) created in 10_data_prep.R, optionally data.descriptive.ads from 20_data_descriptive_ads.R
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  YYYY-MM-DD
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

# 1. Primary Descriptive Table (Table 1) ----------------------------------

# Ensure you use the new object name: data.master.ads
tab.primary.desc <- data.master.ads %>%
  # Start with your existing table logic from describe.R
  tbl_summary(
    include = -id,
    # by = exposure, # Uncomment if you want stratification
  ) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  # modify_table_styling(columns = "label", align = "center") %>%
  # bold_labels() %>% # bolding is preferably done in the document template
  # modify_header(label ~ "...") %>%
  modify_footnote()

# NOTE: The resulting object is named tab.primary.desc
# It is now ready to be saved by 95_cache_results.R

# 2. Final Tables List ----------------------------------------------------

# Create a list of all tables for easy reference later
final.tables.list <- list(
  "Table 1: Baseline"           = tab.primary.desc
)
