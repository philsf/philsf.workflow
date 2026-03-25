# ************************************************************
# Script:   40_data_secondary_ads.R
# Purpose:  Create the Secondary Analysis Dataset (ADS).
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

data.secondary1.ads <- data.master.ads %>%
  mutate(
    outcome.S1 = as_factor(outcome.S1),
  ) %>%
  select(
    id,
    exposure,
    outcome.S1,
    age,
    sex,
    everything(),
  ) %>%
  ## Complete Case Set
  drop_na(
    exposure,
    outcome.S1,
  )
