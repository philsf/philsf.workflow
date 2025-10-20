# 42_output_exploratory_table.R

# Preamble ----------------------------------------------------------------
# Purpose: Create the exploratory Inferential Table (Table 2) by formatting
#          raw model objects from 21- [Multivariate Gig].

# 1. exploratory Inferential Table (e.g., Table 2) ----------------------------

# Uses the helper functions (tab, tab_adj) defined in 00_setup_global.R
tab.exploratory.inf <- tab_adj(
  crude    = model.exploratory.raw,
  adjusted = model.exploratory.adj,
  include  = c("exposure"), # Example: Only include the main exposure in the final table
  # exp = FALSE, # Use the global 'exponentiate' variable defined in 00-
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  # modify_table_styling(columns = "label", align = "center") %>%
  # bold_labels() %>%
  # modify_header(label ~ "...") %>%
  modify_footnote()

# 2. Final Tables List ----------------------------------------------------

# Optional: Create a list of all tables for easy reference later
final.tables.list <- list(
  "Table 1: Baseline" = tab.exploratory.desc,
  "Table 2: exploratory Inference" = tab.exploratory.inf
)
