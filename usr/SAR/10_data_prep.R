# ============================================================
# Script:   10_data_prep.R
# Purpose:  Creates the Master Analysis Dataset (ADS).
#
# Note:     This dataset contains all cleaned, derived, and labeled variables for the study.
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

# Data Loading ------------------------------------------------------------
data.raw <- tibble(
  id=gl(2, 10),
  exposure = gl(2, 10),
  outcome = rnorm(20),
  )
# data.raw <- read_excel("dataset/file.xlsx") %>%
#   janitor::clean_names()

Nvar_orig <- data.raw %>% ncol
Nobs_orig <- data.raw %>% nrow

# Data Cleaning & Core Derivations -----------------------------------------

data.raw <- data.raw %>%
  # 1. Cleaning: Rename, Select, Filter, Mutate operations common to ALL analyses
  rename(
  ) %>%
  select(
    everything(),
  ) %>%
  mutate(
    # e.g., create age groups, convert dates to days, recode key variables
  ) %>%
  filter(
    # e.g., apply global exclusion criteria
  )

# Data Wrangling (e.g., ID formatting)
data.raw <- data.raw %>%
  mutate(
    id = factor(id), # or as.character
    # Other wrangling, e.g., pivot_longer for common wide-to-long structures
  )

# Variable Labels and Metadata --------------------------------------------
# This section is critical for quality gtsummary and SAR output.

data.raw <- data.raw %>%
  set_variable_labels(
    exposure = lab.exposure,
    outcome = lab.primary.outcome,
    # Add all key variables here
  )

# Master Analytical Dataset (ADS) -----------------------------------------
# Final assignment of 'data.master.ads' object for all subsequent scripts (20+, 30+, 40+, 50+).

data.master.ads <- data.raw %>%
  # Select analytic variables only
  select(
    id,
    exposure,
    outcome,
    everything(),
  )

Nvar_final <- data.master.ads %>% ncol
Nobs_final <- data.master.ads %>% nrow


# Objective-Specific ADS Hooks (Future Use) --------------------------------

# NOTE TO USER: Any data manipulation specific to a primary or secondary objective
# (e.g., filtering a cohort, reshaping for a repeated-measures model,
# creating an outcome specific to a single endpoint) MUST occur within the
# respective 20-, 30-, 40- or 50- series analysis script, NOT here.

# Example of a Primary Objective ADS (for internal use in 21_analysis_...)
# data.primary.ads <- data.master.ads %>%
#   filter(is.primary.cohort == TRUE)

# Example of a Secondary Objective ADS
# data.secondary.ads <- data.master.ads %>%
#   select(-some_primary_vars) %>%
#   mutate(new_secondary_outcome = ...)
