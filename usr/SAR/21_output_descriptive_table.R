# 21_output_descriptive_table.R

# Preamble ----------------------------------------------------------------
# Purpose: Create the primary descriptive table (e.g., Table 1).
# Note: Uses the master ADS (data.ads) created in 10_data_prep.R, optionally data.descriptive.ads from 20_data_descriptive_ads.R

# 1. Primary Descriptive Table (Table 1) ----------------------------------

# Ensure you use the new object name: data.ads
tab.primary.desc <- data.ads %>%
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
