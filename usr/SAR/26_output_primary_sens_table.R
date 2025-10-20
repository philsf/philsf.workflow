# 26_output_primary_sens_table.R

# Preamble ----------------------------------------------------------------
# Purpose: Create the Primary Inferential Table (Table 2) by formatting
#          raw model objects from 21- [Multivariate Gig].
# To be uncommented when used.

# 1. Primary Inferential Table (e.g., Table 2) ----------------------------

# Uses the helper functions (tab, tab_adj) defined in 00_setup_global.R
tab.primary.inf <- tab_adj(
  crude    = model.primary.raw.sens,
  adjusted = model.primary.adj.sens,
  include  = c("exposure"), # Example: Only include the main exposure in the final table
  # exp = FALSE, # Use the global 'exponentiate' variable defined in 00-
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  # modify_table_styling(columns = "label", align = "center") %>%
  # bold_labels() %>% # bolding is preferably done in the document template
  # modify_header(label ~ "...") %>%
  modify_footnote()

# 2. Full Table (Appendix) ------------------------------------------------

# Uses the helper functions (tab, tab_adj) defined in 00_setup_global.R
tab.primary.inf.full <- tab_adj(
  crude    = model.primary.raw.sens,
  adjusted = model.primary.adj.sens,
  include  = everything(), # Example: Full table for the Appendix
  # exp = FALSE, # Use the global 'exponentiate' variable defined in 00-
) %>%
  # Apply final formatting (e.g., adding footnotes, headers)
  # modify_table_styling(columns = "label", align = "center") %>%
  # bold_labels() %>% # bolding is preferably done in the document template
  # modify_header(label ~ "...") %>%
  modify_footnote()

# 3. Final Tables List ----------------------------------------------------

# Optional: Create a list of all tables for easy reference later
final.tables.list <- list(
  "Table 3: Primary Sensitivity"  = tab.primary.inf.sens,
  "Table A2: Primary Sensitivity" = tab.primary.inf.full.sens
)
