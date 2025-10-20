# 95_cache_results.R

# Preamble ----------------------------------------------------------------
# Purpose:

# 1. Save Model Objects (Raw output - only needed if 21- ran) -------------
if (exists("model.primary.raw")) {
  write_rds(model.primary.raw, file = "results/model.primary.raw.rds")
  write_rds(model.primary.adj, file = "results/model.primary.adj.rds")
}

# 2. Save Final Table Objects ---------------------------------------------

# Table 1 is always created
write_rds(tab.primary.desc, file = "results/tab.primary.desc.rds")

# Table 2 is the unified object, regardless of which 2x- script created it
if (exists("tab.primary.inf")) {
  write_rds(tab.primary.inf, file = "results/tab.primary.inf.rds")
}

# Table A1 is the unified object
if (exists("tab.primary.inf.full")) {
  write_rds(tab.primary.inf.full, file = "results/tab.primary.inf.full.rds")
}

# 3. Save Final Plot Objects ----------------------------------------------
if (exists("gg.primary.outcome")) {
  write_rds(gg.primary.outcome, file = "results/gg.primary.outcome.rds")
}

# 4. Final list of tables -------------------------------------------------

final.tables.list <- list(
  "Table 1: Baseline" = tab.primary.desc
)

if (exists("tab.primary.inf")) {
  final.tables.list[["Table 2: Primary Inference"]] = tab.primary.inf
}

if (exists("tab.primary.inf.full")) {
  final.tables.list[["Table A1: Primary Inference"]] = tab.primary.inf.full
}

write_rds(final.tables.list, file = "results/final.tables.list.rds")
