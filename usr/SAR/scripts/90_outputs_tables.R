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

# Save Tables to Excel (The Client-Ready Output) --------------------------

# Initialize a master list for all final tables (T1, T2, T3, T4, T5, and Appendices)
final.excel.list <- list()

# Baseline and Primary Tables ---------------------------------------------

# Table 1: Baseline (Created by 21-)
if (exists("tab.baseline")) {
  final.excel.list[["T1 Baseline"]] <- tab.baseline %>% as.data.frame()
}

# Table 2: Primary Inference (Created by 32- or 34-)
if (exists("tab.primary.P1")) {
  final.excel.list[["T.P1 Primary Analysis"]] <- tab.primary.P1 %>% as.data.frame()
}

# Table A1: Full Primary (Created by 32- in Multivariate Gig)
if (exists("tab.primary.P1.full")) {
  final.excel.list[["TA.P1 Primary Inference (Full)"]] <- tab.primary.P1.full %>% as.data.frame()
}

# Secondary Tables --------------------------------------------------------

# Created by 42- to 62-
if (exists("tab.secondary.S1")) {
  final.excel.list[["T.S1 Secondary S1"]] <- tab.secondary.S1 %>% as.data.frame()
}
if (exists("tab.secondary.S1.full")) {
  final.excel.list[["TA.S1 Full Secondary S1"]] <- tab.secondary.S1.full %>% as.data.frame()
}
if (exists("tab.secondary.S2")) {
  final.excel.list[["T.S2 Secondary S2"]] <- tab.secondary.S2 %>% as.data.frame()
}
if (exists("tab.secondary.S2.full")) {
  final.excel.list[["TA.S2 Full Secondary S2"]] <- tab.secondary.S2.full %>% as.data.frame()
}
if (exists("tab.secondary.S3")) {
  final.excel.list[["T.S3 Secondary S3"]] <- tab.secondary.S3 %>% as.data.frame()
}
if (exists("tab.secondary.S3.full")) {
  final.excel.list[["TA.S3 Full Secondary S3"]] <- tab.secondary.S3.full %>% as.data.frame()
}

# Exploratory Tables ------------------------------------------------------

# Created by 72-
if (exists("tab.exploratory.E1")) {
  final.excel.list[["T.E1 Exploratory E1"]] <- tab.exploratory.E1 %>% as.data.frame()
}
if (exists("tab.exploratory.E1.full")) {
  final.excel.list[["TA.E1 Full Exploratory E1"]] <- tab.exploratory.E1.full %>% as.data.frame()
}

# Sensitivity Tables ------------------------------------------------------

# Created by 36-
if (exists("tab.primary.P1.sens")) {
  final.excel.list[["T.P1.sens Sensitivity P1"]] <- tab.primary.P1.sens %>% as.data.frame()
}
if (exists("tab.primary.P1.full.sens")) {
  final.excel.list[["TA.P1.sens Full Sensitivity P1"]] <- tab.primary.P1.full.sens %>% as.data.frame()
}

# Diagnostic Tables -------------------------------------------------------

if (exists("diag.metrics")) {
  final.excel.list[["Diagnostics: Model Metrics"]] <- diag.metrics %>% as.data.frame()
}

if (exists("diag.vif")) {
  final.excel.list[["Diagnostics: VIF"]] <- diag.vif %>% as.data.frame()
}

# Render XLSX file --------------------------------------------------------

# Save the master list if at least one table (Table 1) was found.
if (length(final.excel.list) >= 1) {

  final.excel.list %>%
    writexl::write_xlsx(path = "04 outputs/All_Objective_Tables.xlsx")

  message(paste("Saved", length(final.excel.list), "tables to 04 outputs/All_Objective_Tables.xlsx"))
} else {
  warning("No tables found to save. Please run 99_full_analysis_run.R first.")
}
