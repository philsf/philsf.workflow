# 06_output_table_shells.R

# Preamble ----------------------------------------------------------------
# Purpose: Create mockup table shells for the Statistical Analysis Plan (SAP)
#          using placeholder text instead of real estimates.

# 1. Create Mock Data for Structural Integrity ------------------------------
# NOTE: This data frame must contain all variables used in ALL final tables (T1, T2, T3, etc.)
# It primarily serves to provide the correct variable labels and types.

data.mock <- data.frame(
  id = 1:10, # Always include ID if used in data.ads
  outcome = rnorm(10), # Continuous outcome
  exposure = factor(sample(c("Group A", "Group B"), 10, replace = TRUE)),
  age = runif(10, 20, 60),
  sex = factor(sample(c("Male", "Female"), 10, replace = TRUE))
)

# 2. Table 1: Baseline Characteristics Shell ---------------------------------

tab.baseline.shell <- data.mock %>%
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

# 3. Table 2: Primary Inference Shell ----------------------------------------
# NOTE: This requires a mocked model or manual header modification.

# For simplicity, we create the shell by modifying an empty gtsummary table
tab.inference.shell <- tbl_regression(
  # Provide a simple linear model formula to define the column structure
  glm(outcome ~ exposure + age + sex, data = data.mock)
) %>%
  # Apply the same logic as the final output in 22- (e.g., using exp = FALSE)
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

# 4. Save Shells for SAP -----------------------------------------------------

shell.list <- list(
  "Table 1 Shell" = tab.baseline.shell,
  "Table 2 Shell" = tab.inference.shell
)

# Render shells to a dedicated SAP file (e.g., in the report folder)
shell.list %>%
  writexl::write_xlsx(path = "report/SAP_Table_Shells.xlsx")

message("Saved SAP Table Shells to report/SAP_Table_Shells.xlsx")
