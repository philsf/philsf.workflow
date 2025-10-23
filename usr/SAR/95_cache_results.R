# 95_cache_results.R

# Preamble ----------------------------------------------------------------
# Purpose: Cache all final analysis objects (models, tables, plots) for efficient
#          loading by output scripts (90-, 91-) and RMarkdown reports.

# 1. Save Model Objects (Raw output) --------------------------------------

# Primary Models (from 31-)
if (exists("model.primary.raw")) {
  write_rds(model.primary.raw, file = "results/model.primary.raw.rds")
  if (exists("model.primary.adj")) {
    write_rds(model.primary.adj, file = "results/model.primary.adj.rds")
  }
}

# Sensitivity Models (from 35-)
if (exists("model.primary.raw.sens")) {
  write_rds(model.primary.raw.sens, file = "results/model.primary.raw.sens.rds")
  if (exists("model.primary.adj.sens")) {
    write_rds(model.primary.adj.sens, file = "results/model.primary.adj.sens.rds")
  }
}

# Secondary Models (from 41-)
if (exists("model.secondary.raw")) {
  write_rds(model.secondary.raw, file = "results/model.secondary.raw.rds")
  if (exists("model.secondary.adj")) {
    write_rds(model.secondary.adj, file = "results/model.secondary.adj.rds")
  }
}

# Exploratory Models (from 51-)
if (exists("model.exploratory.raw")) {
  write_rds(model.exploratory.raw, file = "results/model.exploratory.raw.rds")
  if (exists("model.exploratory.adj")) {
    write_rds(model.exploratory.adj, file = "results/model.exploratory.adj.rds")
  }
}

# 2. Save Final Table Objects (gtsummary tables) --------------------------

# Primary Tables (from 21-, 32-, 34-)
write_rds(tab.primary.desc, file = "results/tab.primary.desc.rds") # Always created

if (exists("tab.primary.inf")) {
  write_rds(tab.primary.inf, file = "results/tab.primary.inf.rds")
}
if (exists("tab.primary.inf.full")) {
  write_rds(tab.primary.inf.full, file = "results/tab.primary.inf.full.rds")
}

# Sensitivity Tables (from 36-)
if (exists("tab.primary.inf.sens")) {
  write_rds(tab.primary.inf.sens, file = "results/tab.primary.inf.sens.rds")
}
if (exists("tab.primary.inf.full.sens")) {
  write_rds(tab.primary.inf.full.sens, file = "results/tab.primary.inf.full.sens.rds")
}

# Secondary Tables (from 42-)
if (exists("tab.secondary.inf")) {
  write_rds(tab.secondary.inf, file = "results/tab.secondary.inf.rds")
}
if (exists("tab.secondary.inf.full")) {
  write_rds(tab.secondary.inf.full, file = "results/tab.secondary.inf.full.rds")
}

# Exploratory Tables (from 52-)
if (exists("tab.exploratory.inf")) {
  write_rds(tab.exploratory.inf, file = "results/tab.exploratory.inf.rds")
}
if (exists("tab.exploratory.inf.full")) {
  write_rds(tab.exploratory.inf.full, file = "results/tab.exploratory.inf.full.rds")
}

# 3. Save Final Plot Objects (ggplot objects) -----------------------------

# Primary Plots (from 33-)
if (exists("gg.primary.outcome")) {
  write_rds(gg.primary.outcome, file = "results/gg.primary.outcome.rds")
}
if (exists("gg.primary.predict")) {
  write_rds(gg.primary.predict, file = "results/gg.primary.predict.rds")
}
if (exists("gg.appendix.age")) {
  write_rds(gg.appendix.age, file = "results/gg.appendix.age.rds")
}

# Secondary Plots (from 43-)
if (exists("gg.secondary.outcome")) {
  write_rds(gg.secondary.outcome, file = "results/gg.secondary.outcome.rds")
}
if (exists("gg.secondary.predict")) {
  write_rds(gg.secondary.predict, file = "results/gg.secondary.predict.rds")
}

# Exploratory Plots (from 53-)
if (exists("gg.exploratory.outcome")) {
  write_rds(gg.exploratory.outcome, file = "results/gg.exploratory.outcome.rds")
}
if (exists("gg.exploratory.predict")) {
  write_rds(gg.exploratory.predict, file = "results/gg.exploratory.predict.rds")
}

# 4. Final list of tables -------------------------------------------------

# We must save the complete object built by the pipeline, not overwrite it.
if (exists("final.tables.list")) {
  write_rds(final.tables.list, file = "results/final.tables.list.rds")
  message(paste("Saved final.tables.list containing", length(final.tables.list), "tables."))
} else {
  warning("final.tables.list object was not found. Tables may not be correctly referenced in reports.")
}
