# ============================================================
# Script:   34_output_primary_table_univar.R
# Purpose:  Create the Primary Inferential Table (Table 2) using univariate
#           group comparison tests or effect sizes [Univariate Gig].
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

tab.primary.inf <- data.master.ads %>%
  tbl_summary(
    include = -id,
    by = exposure,
  ) %>%
  add_overall() %>%

# CHOOSE ONE TEMPLATE OPTION BELOW ----------------------------------------

# OPTION 1: Standard P-value Tests (add_p) --------------------------------

add_p(
  # use Fisher test (defaults to chi-square)
  test = all_categorical() ~ "fisher.test",
  # use 3 digits in pvalue
  pvalue_fun = function(x) style_pvalue(x, digits = 3),
) %>%

# OPTION 2: Effect Size or Mean Difference (add_difference) ---------------


# # Uncomment this block and comment out the add_p block above to switch
# add_difference(
#    test = all_continuous() ~ "cohens_d", # or t.test for mean difference
#    # adj.vars = c(sex, age, bmi), # Uncomment for ANCOVA adjustment
# ) %>%
# # Use appropriate header/footnote for the chosen effect size or difference
# modify_header(estimate ~ '**d**') %>% # Example for Cohen's d
# # modify_footnote(update = c(estimate, ci, p.value) ~ "ANCOVA (adjusted by sex, age and BMI)") %>%

# FINAL FORMATTING --------------------------------------------------------

  # Apply final formatting (e.g., adding footnotes, headers)
  # modify_table_styling(columns = "label", align = "center") %>%
  # bold_labels() %>% # bolding is preferably done in the document template
  # modify_header(label ~ "...") %>%
  modify_footnote()

# 2. Final Tables List ----------------------------------------------------

# Update the list of all tables for easy reference later
# final.tables.list <- list(
#   "Table 1: Baseline" = tab.primary.desc,
#   "Table 2: Primary Inference" = tab.primary.inf
# )
final.tables.list[["Table 2: Primary Inference"]] <- tab.primary.inf
