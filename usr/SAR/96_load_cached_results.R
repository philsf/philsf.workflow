# ============================================================
# Script:   96_load_cached_results.R
# Purpose:  Load cached results for use in output scripts or report compilation.
#
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

# 0. Source dependencies if running standalone ----------------------------

# Check for a variable defined in 00_setup_global.R as a lightweight way
# to check if the global environment is already loaded.
if (!exists("formula.primary.raw")) {
  source("scripts/00_setup_global.R")
  source("scripts/10_data_prep.R")
  # Source any required model scripts if plots depend on model objects
  # source("scripts/31_model_primary_inf.R")
}

# 1. Check for results directory ------------------------------------------
if (!file.exists("results/tab.primary.desc.rds")) {
  stop("File 'results/tab.primary.desc.rds' does not exist. Please run 99_full_analysis_run.R first.")
}

# 2. Load Model Objects ----------------------------------------------------

# Primary Models
if (file.exists("results/model.primary.raw.rds")) {
  model.primary.raw <- read_rds("results/model.primary.raw.rds")
}
if (file.exists("results/model.primary.adj.rds")) {
  model.primary.adj <- read_rds("results/model.primary.adj.rds")
}

# Sensitivity Models
if (file.exists("results/model.primary.raw.sens.rds")) {
  model.primary.raw.sens <- read_rds("results/model.primary.raw.sens.rds")
}
if (file.exists("results/model.primary.adj.sens.rds")) {
  model.primary.adj.sens <- read_rds("results/model.primary.adj.sens.rds")
}

# Secondary Models
if (file.exists("results/model.secondary.raw.rds")) {
  model.secondary.raw <- read_rds("results/model.secondary.raw.rds")
}
if (file.exists("results/model.secondary.adj.rds")) {
  model.secondary.adj <- read_rds("results/model.secondary.adj.rds")
}

# Exploratory Models
if (file.exists("results/model.exploratory.raw.rds")) {
  model.exploratory.raw <- read_rds("results/model.exploratory.raw.rds")
}
if (file.exists("results/model.exploratory.adj.rds")) {
  model.exploratory.adj <- read_rds("results/model.exploratory.adj.rds")
}

# 3. Load Final Table Objects ----------------------------------------------

# Primary Tables
tab.primary.desc <- read_rds("results/tab.primary.desc.rds") # Always created

if (file.exists("results/tab.primary.inf.rds")) {
  tab.primary.inf <- read_rds("results/tab.primary.inf.rds")
}
if (file.exists("results/tab.primary.inf.full.rds")) {
  tab.primary.inf.full <- read_rds("results/tab.primary.inf.full.rds")
}

# Sensitivity Tables
if (file.exists("results/tab.primary.inf.sens.rds")) {
  tab.primary.inf.sens <- read_rds("results/tab.primary.inf.sens.rds")
}
if (file.exists("results/tab.primary.inf.full.sens.rds")) {
  tab.primary.inf.full.sens <- read_rds("results/tab.primary.inf.full.sens.rds")
}

# Secondary Tables
if (file.exists("results/tab.secondary.inf.rds")) {
  tab.secondary.inf <- read_rds("results/tab.secondary.inf.rds")
}
if (file.exists("results/tab.secondary.inf.full.rds")) {
  tab.secondary.inf.full <- read_rds("results/tab.secondary.inf.full.rds")
}

# Exploratory Tables
if (file.exists("results/tab.exploratory.inf.rds")) {
  tab.exploratory.inf <- read_rds("results/tab.exploratory.inf.rds")
}
if (file.exists("results/tab.exploratory.inf.full.rds")) {
  tab.exploratory.inf.full <- read_rds("results/tab.exploratory.inf.full.rds")
}

# 4. Load Final Plot Objects ------------------------------------------------

# Primary Plots
if (file.exists("results/gg.primary.outcome.rds")) {
  gg.primary.outcome <- read_rds("results/gg.primary.outcome.rds")
}
if (file.exists("results/gg.primary.predict.rds")) {
  gg.primary.predict <- read_rds("results/gg.primary.predict.rds")
}
if (file.exists("results/gg.appendix.age.rds")) {
  gg.appendix.age <- read_rds("results/gg.appendix.age.rds")
}

# Secondary Plots
if (file.exists("results/gg.secondary.outcome.rds")) {
  gg.secondary.outcome <- read_rds("results/gg.secondary.outcome.rds")
}
if (file.exists("results/gg.secondary.predict.rds")) {
  gg.secondary.predict <- read_rds("results/gg.secondary.predict.rds")
}

# Exploratory Plots
if (file.exists("results/gg.exploratory.outcome.rds")) {
  gg.exploratory.outcome <- read_rds("results/gg.exploratory.outcome.rds")
}
if (file.exists("results/gg.exploratory.predict.rds")) {
  gg.exploratory.predict <- read_rds("results/gg.exploratory.predict.rds")
}

# 5. Load the final list of tables -----------------------------------------
if (file.exists("results/final.tables.list.rds")) {
  final.tables.list <- read_rds("results/final.tables.list.rds")
}
