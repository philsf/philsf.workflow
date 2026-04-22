# ************************************************************
# Script:   96_load_cached_results.R
# Purpose:  Load cached results for use in output scripts or report compilation.
#
# Note:     This script does NOT assume the cache has been created, and it is SAP-friendly
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

# Global environment ------------------------------------------------------

source("02 scripts/00_setup_global.R")
# source("02 scripts/01_data_mock.R")
source("02 scripts/10_data_prep.R") # data.master.ads

# Model Objects -----------------------------------------------------------

# Primary Models
if (file.exists("03 results/model.primary.P1.raw.rds")) {
  model.primary.P1.raw <- read_rds("03 results/model.primary.P1.raw.rds")
}
if (file.exists("03 results/model.primary.P1.adj.rds")) {
  model.primary.P1.adj <- read_rds("03 results/model.primary.P1.adj.rds")
}

# Sensitivity Models
if (file.exists("03 results/model.primary.P1.raw.sens.rds")) {
  model.primary.P1.raw.sens <- read_rds("03 results/model.primary.P1.raw.sens.rds")
}
if (file.exists("03 results/model.primary.P1.adj.sens.rds")) {
  model.primary.P1.adj.sens <- read_rds("03 results/model.primary.P1.adj.sens.rds")
}

# Secondary Models
if (file.exists("03 results/model.secondary.S1.raw.rds")) {
  model.secondary.S1.raw <- read_rds("03 results/model.secondary.S1.raw.rds")
}
if (file.exists("03 results/model.secondary.S1.adj.rds")) {
  model.secondary.S1.adj <- read_rds("03 results/model.secondary.S1.adj.rds")
}

if (file.exists("03 results/model.secondary.S2.raw.rds")) {
  model.secondary.S2.raw <- read_rds("03 results/model.secondary.S2.raw.rds")
}
if (file.exists("03 results/model.secondary.S2.adj.rds")) {
  model.secondary.S2.adj <- read_rds("03 results/model.secondary.S2.adj.rds")
}

if (file.exists("03 results/model.secondary.S3.raw.rds")) {
  model.secondary.S3.raw <- read_rds("03 results/model.secondary.S3.raw.rds")
}
if (file.exists("03 results/model.secondary.S3.adj.rds")) {
  model.secondary.S3.adj <- read_rds("03 results/model.secondary.S3.adj.rds")
}

# Exploratory Models
if (file.exists("03 results/model.exploratory.E1.raw.rds")) {
  model.exploratory.E1.raw <- read_rds("03 results/model.exploratory.E1.raw.rds")
}
if (file.exists("03 results/model.exploratory.E1.adj.rds")) {
  model.exploratory.E1.adj <- read_rds("03 results/model.exploratory.E1.adj.rds")
}

# Table Objects -----------------------------------------------------------

# Baseline Table
source("02 scripts/20_data_baseline_ads.R") # data.baseline.ads
if (file.exists("03 results/tab.baseline.rds")) {
  tab.baseline <- read_rds("03 results/tab.baseline.rds")
}

# Primary Tables
source("02 scripts/30_data_primary1_ads.R") # data.primary1.ads
if (file.exists("03 results/tab.primary.P1.rds")) {
  tab.primary.P1 <- read_rds("03 results/tab.primary.P1.rds")
}
if (file.exists("03 results/tab.primary.P1.full.rds")) {
  tab.primary.P1.full <- read_rds("03 results/tab.primary.P1.full.rds")
}

# Sensitivity Tables
if (file.exists("03 results/tab.primary.P1.sens.rds")) {
  tab.primary.P1.sens <- read_rds("03 results/tab.primary.P1.sens.rds")
}
if (file.exists("03 results/tab.primary.P1.full.sens.rds")) {
  tab.primary.P1.full.sens <- read_rds("03 results/tab.primary.P1.full.sens.rds")
}

# Secondary Tables
source("02 scripts/40_data_secondary1_ads.R") # data.secondary1.ads
if (file.exists("03 results/tab.secondary.S1.rds")) {
  tab.secondary.S1 <- read_rds("03 results/tab.secondary.S1.rds")
}
if (file.exists("03 results/tab.secondary.S1.full.rds")) {
  tab.secondary.S1.full <- read_rds("03 results/tab.secondary.S1.full.rds")
}

source("02 scripts/50_data_secondary2_ads.R") # data.secondary2.ads
if (file.exists("03 results/tab.secondary.S2.rds")) {
  tab.secondary.S2 <- read_rds("03 results/tab.secondary.S2.rds")
}
if (file.exists("03 results/tab.secondary.S2.full.rds")) {
  tab.secondary.S2.full <- read_rds("03 results/tab.secondary.S2.full.rds")
}

source("02 scripts/60_data_secondary3_ads.R") # data.secondary3.ads
if (file.exists("03 results/tab.secondary.S3.rds")) {
  tab.secondary.S3 <- read_rds("03 results/tab.secondary.S3.rds")
}
if (file.exists("03 results/tab.secondary.S3.full.rds")) {
  tab.secondary.S3.full <- read_rds("03 results/tab.secondary.S3.full.rds")
}

# Exploratory Tables
source("02 scripts/70_data_exploratory1_ads.R") # data.exploratory1.ads
if (file.exists("03 results/tab.exploratory.E1.rds")) {
  tab.exploratory.E1 <- read_rds("03 results/tab.exploratory.E1.rds")
}
if (file.exists("03 results/tab.exploratory.E1.full.rds")) {
  tab.exploratory.E1.full <- read_rds("03 results/tab.exploratory.E1.full.rds")
}

# Plot Objects ------------------------------------------------------------

# Population Flow
if (file.exists("03 results/gg.cohort_flow.rds")) {
  gg.cohort_flow <- read_rds("03 results/gg.cohort_flow.rds")
}

# Primary Plots
if (file.exists("03 results/gg.primary.P1.outcome.rds")) {
  gg.primary.P1.outcome <- read_rds("03 results/gg.primary.P1.outcome.rds")
}
if (file.exists("03 results/gg.primary.P1.predict.rds")) {
  gg.primary.P1.predict <- read_rds("03 results/gg.primary.P1.predict.rds")
}
if (file.exists("03 results/gg.appendix.age.rds")) {
  gg.appendix.age <- read_rds("03 results/gg.appendix.age.rds")
}

# Secondary Plots
if (file.exists("03 results/gg.secondary.S1.outcome.rds")) {
  gg.secondary.S1.outcome <- read_rds("03 results/gg.secondary.S1.outcome.rds")
}
if (file.exists("03 results/gg.secondary.S1.predict.rds")) {
  gg.secondary.S1.predict <- read_rds("03 results/gg.secondary.S1.predict.rds")
}

# Exploratory Plots
if (file.exists("03 results/gg.exploratory.E1.outcome.rds")) {
  gg.exploratory.E1.outcome <- read_rds("03 results/gg.exploratory.E1.outcome.rds")
}
if (file.exists("03 results/gg.exploratory.E1.predict.rds")) {
  gg.exploratory.E1.predict <- read_rds("03 results/gg.exploratory.E1.predict.rds")
}

# Diagnostic Objects ------------------------------------------------------

# load individual objects

if (file.exists("03 results/diag.primary.P1.rds")) {
  diag.primary.P1 <- read_rds("03 results/diag.primary.P1.rds")
}
if (file.exists("03 results/diag.secondary.S1.rds")) {
  diag.secondary.S1 <- read_rds("03 results/diag.secondary.S1.rds")
}
if (file.exists("03 results/diag.secondary.S2.rds")) {
  diag.secondary.S2 <- read_rds("03 results/diag.secondary.S2.rds")
}
if (file.exists("03 results/diag.secondary.S3.rds")) {
  diag.secondary.S3 <- read_rds("03 results/diag.secondary.S3.rds")
}
if (file.exists("03 results/diag.exploratory.E1.rds")) {
  diag.exploratory.E1 <- read_rds("03 results/diag.exploratory.E1.rds")
}

# load master objects

if (exists("03 results/diag.metrics.rds")) {
  diag.metrics <- read_rds("03 results/diag.metrics.rds")
}

if (exists("03 results/diag.vif.rds")) {
  diag.vif <- read_rds("03 results/diag.vif.rds")
}
