# 32_output_secondary_table.R

# Preamble ----------------------------------------------------------------
# Purpose: Create the secondary Inferential Table (Table 2) by formatting
#          raw model objects from 21- [Multivariate Gig].

# 1. secondary Inferential Table (e.g., Table 2) ----------------------------

# Uses the helper functions (tab, tab_adj) defined in 00_setup_global.R
tab.secondary.inf <- tab_adj(
  crude    = model.secondary.raw,
  adjusted = model.secondary.adj,
  include  = c("exposure"), # Example: Only include the main exposure in the final table
  # exp = FALSE, # Use the global 'exponentiate' variable defined in 00-
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  # modify_table_styling(columns = "label", align = "center") %>%
  # bold_labels() %>%
  # modify_header(label ~ "...") %>%
  modify_footnote()

# 2. Final Tables List ----------------------------------------------------

final.tables.list[["Table 4: Secondary Inf"]] <- tab.secondary.inf
