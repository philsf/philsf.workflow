# 96_load_cached_results.R

# Preamble ----------------------------------------------------------------
# Purpose:

# 1. Check for results directory ------------------------------------------
if (!file.exists("results/tab.primary.desc.rds")) {
  stop("File 'results/tab.primary.desc.rds' does not exist. Please run 99_full_analysis_run.R first.")
}

# 2. Load Model Objects (needed if you reference them in the report)
if (file.exists("results/model.primary.raw.rds")) {
  model.primary.raw <- read_rds("results/model.primary.raw.rds")
  model.primary.adj <- read_rds("results/model.primary.adj.rds")
}

# 3. Load Final Table Objects
tab.primary.desc <- read_rds("results/tab.primary.desc.rds")

# Load the single, canonical Table 2 object
if (file.exists("results/tab.primary.inf.rds")) {
  tab.primary.inf <- read_rds("results/tab.primary.inf.rds")
}

# Load the single, canonical Table A1 object
if (file.exists("results/tab.primary.inf.full.rds")) {
  tab.primary.inf <- read_rds("results/tab.primary.inf.full.rds")
}

# 4. Load Final Plot Objects
if (file.exists("results/gg.primary.outcome.rds")) {
  gg.primary.outcome <- read_rds("results/gg.primary.outcome.rds")
}

# 5. Load the final list of tables
final.tables.list <- read_rds("results/final.tables.list.rds")
