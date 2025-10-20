# 24_output_primary_table_univar.R

# Preamble ----------------------------------------------------------------
# Purpose: Create the Primary Inferential Table (Table 2) using univariate
#          group comparison tests or effect sizes [Univariate Gig].

tab.primary.inf <- data.ads %>%
  tbl_summary(
    include = -id,
    by = exposure,
  ) %>%
  add_overall() %>%

  # --- CHOOSE ONE TEMPLATE OPTION BELOW ---

  # TEMPLATE OPTION 1: Standard P-value Tests (add_p) ---------------------
add_p(
  # use Fisher test (defaults to chi-square)
  test = all_categorical() ~ "fisher.test",
  # use 3 digits in pvalue
  pvalue_fun = function(x) style_pvalue(x, digits = 3),
) %>%
  bold_p() %>% # Bold significant p-values
  # ----------------------------------------------------------------------

# # TEMPLATE OPTION 2: Effect Size (Cohen's d) or Mean Difference (add_difference)
# # Uncomment this block and comment out the add_p block above to switch
# add_difference(
#    test = all_continuous() ~ "cohens_d", # or t.test for mean difference
#    # adj.vars = c(sex, age, bmi), # Uncomment for ANCOVA adjustment
# ) %>%
# # Use appropriate header/footnote for the chosen effect size or difference
# modify_header(estimate ~ '**d**') %>% # Example for Cohen's d
# # modify_footnote(update = c(estimate, ci, p.value) ~ "ANCOVA (adjusted by sex, age and BMI)") %>%
# bold_labels() %>%
# ----------------------------------------------------------------------

modify_table_styling(columns = "label", align = "center")
