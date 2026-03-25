# ************************************************************
# Script:   10_data_prep.R
# Purpose:  Creates the Master Analysis Dataset (ADS).
#
# Note:     This is the Full Analysis Set (FAS).
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

# Data Loading ------------------------------------------------------------

## Load raw data file

# Mock data: replace these commands with RW data
source(here("02 scripts", "01_data_mock.R"))
data.raw <- data.mock.ads

# data.raw <- read_excel("01 dataset/file.xlsx") %>%
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
    # id = factor(id), # or as.character
    # Other wrangling, e.g., pivot_longer for common wide-to-long structures
  )

# Eligibility Criteria ----------------------------------------------------

# Inclusion criterion 1
data.raw <- data.raw %>%
  mutate(
    inc_crit1 = TRUE,
  )
Nobs_inc.crit1 <- data.raw %>% pull(inc_crit1) %>% sum()

# Inclusion criterion 2
data.raw <- data.raw %>%
  mutate(
    inc_crit2 = TRUE,
  )
Nobs_inc.crit2 <- data.raw %>% pull(inc_crit2) %>% sum()

# Inclusion criterion 3
data.raw <- data.raw %>%
  mutate(
    inc_crit3 = TRUE,
  )
Nobs_inc.crit3 <- data.raw %>% pull(inc_crit3) %>% sum()

# Exclusion criterion 1
data.raw <- data.raw %>%
  mutate(
    exc_crit1 = FALSE,
  )

Nobs_exc.crit1 <- data.raw %>% pull(exc_crit1) %>% sum()

# Variable Labels and Metadata --------------------------------------------
# This section is critical for quality gtsummary and SAR output.

data.raw <- data.raw %>%
  set_variable_labels(
    exposure   = lab.exposure,
    outcome.P1 = lab.outcome.P1,
    outcome.S1 = lab.outcome.S1,
    outcome.S2 = lab.outcome.S2,
    outcome.S3 = lab.outcome.S3,
    outcome.E1 = lab.outcome.E1,
    # Add all key variables here
    age = lab.age,
    sex = lab.sex,
  )

# Master Analytic Dataset (ADS) -------------------------------------------
# Final assignment of 'data.master.ads' object for all subsequent scripts (20+, 30+, 40+, 50+).

data.master.ads <- data.raw %>%
  # Apply eligibility criteria
  filter(inc_crit1, inc_crit2, inc_crit3, !exc_crit1) %>%
  # Select analytic variables only
  select(
    id,
    exposure,
    outcome.P1,
    outcome.S1,
    outcome.S2,
    outcome.S3,
    outcome.E1,
    age,
    sex,
    time.E1,
    # everything(),
  )

Nvar_final <- data.master.ads %>% ncol
Nobs_final <- data.master.ads %>% nrow


# Objective-Specific ADS Hooks (Future Use) --------------------------------

# NOTE TO USER: Any data manipulation specific to a primary or secondary objective
# (e.g., filtering a cohort, reshaping for a repeated-measures model,
# creating an outcome specific to a single endpoint) MUST occur within the
# respective 20-, 30-, 40- or 50- series analysis script, NOT here.

# Example of a Primary Objective ADS (for internal use in 31_analysis_...)
# data.primary.ads <- data.master.ads %>%
#   filter(is.primary.cohort == TRUE)

# Example of a Secondary Objective ADS
# data.secondary.ads <- data.master.ads %>%
#   select(-some_primary_vars) %>%
#   mutate(new_secondary_outcome = ...)
