# ============================================================
# Script:   90_outputs_tables.R
# Purpose:  Render and save final tables from cached gtsummary objects to Excel.
#
# Note:     This script ASSUMES the cache has been created by running 99_full_analysis_run.R
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

# 1. Load Cached Results --------------------------------------------------

# ONLY load the cache if a key analysis object (like the descriptive table)
# is NOT found in the current environment. This prevents redundant re-loading
# when sourced by the full analysis script (99_full_analysis_run.R).
if (!exists("tab.primary.desc")) {
  source("scripts/96_load_cached_results.R")
}
# NOTE: If we run in Manual Mode, 96- will load tab.primary.desc,
# and the rest of the script will proceed normally.

# 2. Save Tables to Excel (The Client-Ready Output) -------------------------

# Initialize a master list for all final tables (T1, T2, T3, T4, T5, and Appendices)
final.excel.list <- list()

# ----------------- PRIMARY TABLES (T1, T2, A1) --------------------------

# Table 1: Baseline (Always created by 20-)
if (exists("tab.primary.desc")) {
  final.excel.list[["Table 1: Baseline"]] <- tab.primary.desc %>% as.data.frame()
}

# Table 2: Primary Inference (Created by 32- or 34-)
if (exists("tab.primary.inf")) {
  final.excel.list[["Table 2: Primary Inference"]] <- tab.primary.inf %>% as.data.frame()
}

# Table A1: Full Primary (Created by 32- in Multivariate Gig)
if (exists("tab.primary.inf.full")) {
  final.excel.list[["Table A1: Primary Inference (Full)"]] <- tab.primary.inf.full %>% as.data.frame()
}

# ----------------- SENSITIVITY TABLES (T3, A2) --------------------------
# Created by 36_output_primary_sens_table.R
if (exists("tab.primary.inf.sens")) {
  final.excel.list[["Table 3: Sensitivity Inf"]] <- tab.primary.inf.sens %>% as.data.frame()
}
if (exists("tab.primary.inf.full.sens")) {
  final.excel.list[["Table A2: Full Sensitivity Inf"]] <- tab.primary.inf.full.sens %>% as.data.frame()
}

# ----------------- SECONDARY TABLES (T4, A3) -----------------------------
# Created by 42_output_secondary_table.R
if (exists("tab.secondary.inf")) {
  final.excel.list[["Table 4: Secondary Inf"]] <- tab.secondary.inf %>% as.data.frame()
}
if (exists("tab.secondary.inf.full")) {
  final.excel.list[["Table A3: Full Secondary Inf"]] <- tab.secondary.inf.full %>% as.data.frame()
}

# ----------------- EXPLORATORY TABLES (T5, A4) ---------------------------
# Created by 52_output_exploratory_table.R
if (exists("tab.exploratory.inf")) {
  final.excel.list[["Table 5: Exploratory Inf"]] <- tab.exploratory.inf %>% as.data.frame()
}
if (exists("tab.exploratory.inf.full")) {
  final.excel.list[["Table A4: Full Exploratory Inf"]] <- tab.exploratory.inf.full %>% as.data.frame()
}


# ----------------- FINAL SAVE CHECK --------------------------------------

# Save the master list if at least one table (Table 1) was found.
if (length(final.excel.list) >= 1) {

  final.excel.list %>%
    # writexl library is loaded in 00-setup-global.R
    writexl::write_xlsx(path = "report/tables/All_Objective_Tables.xlsx")

  message(paste("Saved", length(final.excel.list), "tables to report/tables/All_Objective_Tables.xlsx"))
} else {
  warning("No tables found to save. Please run 99_full_analysis_run.R first.")
}
