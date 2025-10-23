# ============================================================
# Script:   06_output_table_shells.R
# Purpose:  Create mockup table shells for the Statistical Analysis Plan (SAP)
#           using placeholder text instead of real estimates.
# Note:     N/A
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

# 1. Table 1: Baseline Characteristics Shell ---------------------------------

tab.baseline.shell <- data.master.ads %>%
  tbl_summary(
    include = -id,
    by = exposure
  ) %>%
  add_p() %>%
  # Global placeholder to remove real p-values and statistics
  modify_table_body(
    fun = function(x) {
      x %>% mutate(
        # Replace descriptive statistics with placeholders
        across(starts_with("stat_"), ~ "x.xx (x.xx)"),
        # Replace p-values
        p.value = "x.xxx"
      )
    }
  ) %>%
  # Update headers to match the SAP
  modify_header(
    list(
      label ~ "**Variable**",
      stat_by ~ "**Characteristic (N)**"
    )
  ) %>%
  # Final SAP footnote
  modify_footnote(update = all_stat_cols() ~ "Data presented as mean (SD) or N (%); p-values are placeholders.")

# 2. Table 2: Primary Inference Shell ----------------------------------------
# NOTE: This requires a mocked model or manual header modification.

# For simplicity, we create the shell by modifying an empty gtsummary table
tab.inference.shell <- tbl_regression(
  # Provide a simple linear model formula to define the column structure
  glm(outcome ~ exposure + age + sex, data = data.master.ads)
) %>%
  # Apply the same logic as the final output in 32- (e.g., using exp = FALSE)
  # Here we manually replace the header and footer for simplicity
  modify_header(
    estimate ~ "**Estimate**",
    ci ~ "**(x.xx, x.xx)**",
    p.value ~ "**P-value**"
  ) %>%
  # Replace all real statistics in the body with placeholders
  modify_table_body(
    fun = function(x) {
      x %>% mutate(
        across(c(estimate, ci, p.value), ~ "x.xx")
      )
    }
  ) %>%
  modify_footnote(update = everything() ~ "Mock estimates and confidence intervals are placeholders.")

# 3. Save Shells for SAP -----------------------------------------------------

shell.list <- list(
  "Table 1 Shell" = tab.baseline.shell,
  "Table 2 Shell" = tab.inference.shell
)

# Render shells to a dedicated SAP file (e.g., in the report folder)
shell.list %>%
  writexl::write_xlsx(path = "report/SAP_Table_Shells.xlsx")

message("Saved SAP Table Shells to report/SAP_Table_Shells.xlsx")
