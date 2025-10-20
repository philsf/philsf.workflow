# 91_outputs_tables.R

# Preamble ----------------------------------------------------------------
# Purpose: Render and save final tables from cached gtsummary objects to Excel.
# NOTE: This script ASSUMES the cache has been created by running 99_full_analysis_run.R

# 1. Load Cached Results --------------------------------------------------
source("96_load_cached_results.R")

# 2. Save Tables to Excel (The Client-Ready Output) -------------------------

# The as.data.frame() conversion extracts the final rendered table content.
if (exists("tab.primary.desc") && exists("tab.primary.inf")) {
  list(
    "Table 1: Baseline"          = tab.primary.desc %>% as.data.frame(),
    "Table 2: Primary Inference" = tab.primary.inf  %>% as.data.frame()
  ) %>%
    # writexl library is loaded in 00-setup-global.R
    writexl::write_xlsx(path = "report/tables/Primary_Objective_Tables.xlsx")

  message("Saved Tables 1 and 2 to report/tables/Primary_Objective_Tables.xlsx")
} else {
  warning("Required table objects (tab.primary.desc, tab.primary.inf) not found. Run 99_full_analysis_run.R first.")
}
