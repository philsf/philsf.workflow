# 20_analysis_primary_desc.R

# Preamble ----------------------------------------------------------------
# Purpose: Create the primary descriptive table (e.g., Table 1).
# Uses the master ADS (data.ads) created in 10_data_prep.R

# 1. Primary Descriptive Table (Table 1) ----------------------------------

# Ensure you use the new object name: data.ads
tab.primary.obj.desc <- data.ads %>%
  # Start with your existing table logic from describe.R
  tbl_summary(
    include = -id,
    # by = exposure, # Uncomment if you want stratification
  ) %>%
  # Apply all your existing formatting:
  # modify_caption(caption = "...") %>%
  # modify_header(label ~ "...") %>%
  # bold_labels() %>%
  modify_table_styling(columns = "label", align = "center")

# NOTE: The resulting object is named tab.primary.desc.obj
# It is now ready to be saved by 95_cache_results.R
