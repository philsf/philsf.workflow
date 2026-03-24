# ************************************************************
# Script:   90_outputs_tables.R
# Purpose:  Render and save final tables from cached gtsummary objects to Excel.
#
# Note:     This script ASSUMES the cache has been created by running 99_full_analysis_run.R
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

# 1. Load Cached Results --------------------------------------------------

# # ONLY load the cache if a key analysis object (like the descriptive table)
# # is NOT found in the current environment. This prevents redundant re-loading
# # when sourced by the full analysis script (99_full_analysis_run.R).
# if (!exists("tab.baseline")) {
#   source("02 scripts/96_load_cached_results.R")
# }
# # NOTE: If we run in Manual Mode, 96- will load tab.primary.desc,
# # and the rest of the script will proceed normally.

# 2. Save Tables to Excel (The Client-Ready Output) -------------------------

# Initialize a master list for all final tables (T1, T2, T3, T4, T5, and Appendices)
final.excel.list <- list()

# ----------------- PRIMARY TABLES (T1, T2, A1) --------------------------

# Table 1: Baseline (Always created by 20-)
if (exists("tab.baseline")) {
  final.excel.list[["T1 Baseline"]] <- tab.baseline %>% as.data.frame()
}

# Table 2: Primary Inference (Created by 32- or 34-)
if (exists("tab.primary.P1")) {
  final.excel.list[["T2 Primary Analysis"]] <- tab.primary.P1 %>% as.data.frame()
}

# Table A1: Full Primary (Created by 32- in Multivariate Gig)
if (exists("tab.primary.P1.full")) {
  final.excel.list[["TA1 Primary Inference (Full)"]] <- tab.primary.P1.full %>% as.data.frame()
}

# ----------------- SENSITIVITY TABLES (T3, A2) --------------------------
# Created by 36_output_primary_sens_table.R
if (exists("tab.primary.P1.sens")) {
  final.excel.list[["T3 Sensitivity P1"]] <- tab.primary.P1.sens %>% as.data.frame()
}
if (exists("tab.primary.P1.full.sens")) {
  final.excel.list[["TA2 Full Sensitivity P1"]] <- tab.primary.P1.full.sens %>% as.data.frame()
}

# ----------------- SECONDARY TABLES (T4, A3) -----------------------------
# Created by 42_output_secondary_table.R
if (exists("tab.secondary.S1")) {
  final.excel.list[["T4 Secondary S1"]] <- tab.secondary.S1 %>% as.data.frame()
}
if (exists("tab.secondary.S1.full")) {
  final.excel.list[["TA3 Full Secondary S1"]] <- tab.secondary.S1.full %>% as.data.frame()
}
if (exists("tab.secondary.S2")) {
  final.excel.list[["T5 Secondary S2"]] <- tab.secondary.S2 %>% as.data.frame()
}
if (exists("tab.secondary.S2.full")) {
  final.excel.list[["TA4 Full Secondary S2"]] <- tab.secondary.S2.full %>% as.data.frame()
}
if (exists("tab.secondary.S3")) {
  final.excel.list[["T6 Secondary S3"]] <- tab.secondary.S3 %>% as.data.frame()
}
if (exists("tab.secondary.S3.full")) {
  final.excel.list[["TA5 Full Secondary S3"]] <- tab.secondary.S3.full %>% as.data.frame()
}

# ----------------- EXPLORATORY TABLES (T5, A4) ---------------------------
# Created by 52_output_exploratory_table.R
if (exists("tab.exploratory.E1")) {
  final.excel.list[["T7 Exploratory E1"]] <- tab.exploratory.E1 %>% as.data.frame()
}
if (exists("tab.exploratory.E1.full")) {
  final.excel.list[["TA5 Full Exploratory E1"]] <- tab.exploratory.E1.full %>% as.data.frame()
}

# ----------------- FINAL SAVE CHECK --------------------------------------

# Save the master list if at least one table (Table 1) was found.
if (length(final.excel.list) >= 1) {

  final.excel.list %>%
    # writexl library is loaded in 00-setup-global.R
    writexl::write_xlsx(path = "04 outputs/All_Objective_Tables.xlsx")

  message(paste("Saved", length(final.excel.list), "tables to 04 outputs/All_Objective_Tables.xlsx"))
} else {
  warning("No tables found to save. Please run 99_full_analysis_run.R first.")
}
