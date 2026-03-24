# ************************************************************
# Script:   50_data_secondary2_ads.R
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

data.secondary2.ads <- data.master.ads %>%
  mutate(
    # outcome.S2 = as_factor(outcome.S2),
  ) %>%
  select(
    id,
    exposure,
    outcome.S2,
    age,
    sex,
    everything(),
  ) %>%
  ## Complete Case Set
  drop_na(
    exposure,
    outcome.S2,
  )
