# ************************************************************
# Script:   95_cache_results.R
# Purpose:  Cache all final analysis objects (models, tables, plots) for efficient
#           loading by output scripts (90-, 91-) and RMarkdown reports.
# Note:     N/A
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

# 1. Save Model Objects (Raw output) --------------------------------------

# Primary Models (from 31-)
if (exists("model.primary.P1.raw")) {
  write_rds(model.primary.P1.raw, file = "03 results/model.primary.P1.raw.rds")
  if (exists("model.primary.P1.adj")) {
    write_rds(model.primary.P1.adj, file = "03 results/model.primary.P1.adj.rds")
  }
}

# Sensitivity Models (from 35-)
if (exists("model.primary.P1.raw.sens")) {
  write_rds(model.primary.P1.raw.sens, file = "03 results/model.primary.P1.raw.sens.rds")
  if (exists("model.primary.P1.adj.sens")) {
    write_rds(model.primary.P1.adj.sens, file = "03 results/model.primary.P1.adj.sens.rds")
  }
}

# Secondary Models (from 41-)
if (exists("model.secondary.S1.raw")) {
  write_rds(model.secondary.S1.raw, file = "03 results/model.secondary.S1.raw.rds")
  if (exists("model.secondary.S1.adj")) {
    write_rds(model.secondary.S1.adj, file = "03 results/model.secondary.S1.adj.rds")
  }
}
if (exists("model.secondary.S2.raw")) {
  write_rds(model.secondary.S2.raw, file = "03 results/model.secondary.S2.raw.rds")
  if (exists("model.secondary.S2.adj")) {
    write_rds(model.secondary.S2.adj, file = "03 results/model.secondary.S2.adj.rds")
  }
}
if (exists("model.secondary.S3.raw")) {
  write_rds(model.secondary.S3.raw, file = "03 results/model.secondary.S3.raw.rds")
  if (exists("model.secondary.S3.adj")) {
    write_rds(model.secondary.S3.adj, file = "03 results/model.secondary.S3.adj.rds")
  }
}

# Exploratory Models (from 71-)
if (exists("model.exploratory.E1.raw")) {
  write_rds(model.exploratory.E1.raw, file = "03 results/model.exploratory.E1.raw.rds")
  if (exists("model.exploratory.E1.adj")) {
    write_rds(model.exploratory.E1.adj, file = "03 results/model.exploratory.E1.adj.rds")
  }
}

# 2. Save Final Table Objects (gtsummary tables) --------------------------

# Primary Tables (from 21-, 32-, 34-)
if(exists("tab.baseline")) {
  write_rds(tab.baseline, file = "03 results/tab.baseline.rds")
}

if (exists("tab.primary.P1")) {
  write_rds(tab.primary.P1, file = "03 results/tab.primary.P1.rds")
}
if (exists("tab.primary.P1.full")) {
  write_rds(tab.primary.P1.full, file = "03 results/tab.primary.P1.full.rds")
}

# Sensitivity Tables (from 36-)
if (exists("tab.primary.P1.sens")) {
  write_rds(tab.primary.P1.sens, file = "03 results/tab.primary.P1.sens.rds")
}
if (exists("tab.primary.P1.full.sens")) {
  write_rds(tab.primary.P1.full.sens, file = "03 results/tab.primary.P1.full.sens.rds")
}

# Secondary Tables (from 42-)
if (exists("tab.secondary.S1")) {
  write_rds(tab.secondary.S1, file = "03 results/tab.secondary.S1.rds")
}
if (exists("tab.secondary.S1.full")) {
  write_rds(tab.secondary.S1.full, file = "03 results/tab.secondary.S1.full.rds")
}
if (exists("tab.secondary.S2")) {
  write_rds(tab.secondary.S2, file = "03 results/tab.secondary.S2.rds")
}
if (exists("tab.secondary.S2.full")) {
  write_rds(tab.secondary.S2.full, file = "03 results/tab.secondary.S2.full.rds")
}
if (exists("tab.secondary.S3")) {
  write_rds(tab.secondary.S3, file = "03 results/tab.secondary.S3.rds")
}
if (exists("tab.secondary.S3.full")) {
  write_rds(tab.secondary.S3.full, file = "03 results/tab.secondary.S3.full.rds")
}

# Exploratory Tables (from 52-)
if (exists("tab.exploratory.E1")) {
  write_rds(tab.exploratory.E1, file = "03 results/tab.exploratory.E1.rds")
}
if (exists("tab.exploratory.E1.full")) {
  write_rds(tab.exploratory.E1.full, file = "03 results/tab.exploratory.E1.full.rds")
}

# 3. Save Final Plot Objects (ggplot objects) -----------------------------

# Population Flow (from 22-)
if (exists("gg.cohort_flow")) {
  write_rds(gg.cohort_flow, file = "03 results/gg.cohort_flow.rds")
}

# Primary Plots (from 33-)
if (exists("gg.primary.P1.outcome")) {
  write_rds(gg.primary.P1.outcome, file = "03 results/gg.primary.P1.outcome.rds")
}
if (exists("gg.primary.P1.predict")) {
  write_rds(gg.primary.P1.predict, file = "03 results/gg.primary.P1.predict.rds")
}
if (exists("gg.appendix.age")) {
  write_rds(gg.appendix.age, file = "03 results/gg.appendix.age.rds")
}

# Secondary Plots (from 43-)
if (exists("gg.secondary.S1.outcome")) {
  write_rds(gg.secondary.S1.outcome, file = "03 results/gg.secondary.S1.outcome.rds")
}
if (exists("gg.secondary.S1.predict")) {
  write_rds(gg.secondary.S1.predict, file = "03 results/gg.secondary.S1.predict.rds")
}
if (exists("gg.secondary.S2.outcome")) {
  write_rds(gg.secondary.S2.outcome, file = "03 results/gg.secondary.S2.outcome.rds")
}
if (exists("gg.secondary.S2.predict")) {
  write_rds(gg.secondary.S2.predict, file = "03 results/gg.secondary.S2.predict.rds")
}
if (exists("gg.secondary.S3.outcome")) {
  write_rds(gg.secondary.S3.outcome, file = "03 results/gg.secondary.S3.outcome.rds")
}
if (exists("gg.secondary.S3.predict")) {
  write_rds(gg.secondary.S3.predict, file = "03 results/gg.secondary.S3.predict.rds")
}

# Exploratory Plots (from 73-)
if (exists("gg.exploratory.E1.outcome")) {
  write_rds(gg.exploratory.E1.outcome, file = "03 results/gg.exploratory.E1.outcome.rds")
}
if (exists("gg.exploratory.E1.predict")) {
  write_rds(gg.exploratory.E1.predict, file = "03 results/gg.exploratory.E1.predict.rds")
}

# 4. Final list of tables -------------------------------------------------

# # We must save the complete object built by the pipeline, not overwrite it.
# if (exists("final.tables.list")) {
#   write_rds(final.tables.list, file = "03 results/final.tables.list.rds")
#   message(paste("Saved final.tables.list containing", length(final.tables.list), "tables."))
# } else {
#   warning("final.tables.list object was not found. Tables may not be correctly referenced in reports.")
# }
