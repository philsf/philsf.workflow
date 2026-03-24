# ************************************************************
# Script:   60_data_secondary3_ads.R
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

data.secondary3.ads <- data.master.ads %>%
  mutate(
    outcome.S3 = as_factor(outcome.S3),
  ) %>%
  select(
    id,
    exposure,
    outcome.S3,
    age,
    sex,
    everything(),
  ) %>%
  ## Complete Case Set
  drop_na(
    exposure,
    outcome.S3,
  )
