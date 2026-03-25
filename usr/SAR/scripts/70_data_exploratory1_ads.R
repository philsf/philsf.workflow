# ************************************************************
# Script:   70_data_exploratory1_ads.R
# Purpose:  Create the Exploratory 1 Analysis Dataset (ADS).
#
# Note:     N/A
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2026-03-21
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

data.exploratory1.ads <- data.master.ads %>%
  mutate(
    # outcome.E1 = as_factor(outcome.E1),
  ) %>%
  select(
    id,
    exposure,
    outcome.E1,
    age,
    sex,
    everything(),
  ) %>%
  ## Complete Case Set
  drop_na(
    exposure,
    outcome.E1,
  )
