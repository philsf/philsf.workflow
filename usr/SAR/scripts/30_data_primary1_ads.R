# ************************************************************
# Script:   30_data_primary1_ads.R
# Purpose:  Create the Primary Analysis Dataset (ADS).
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

data.primary1.ads <- data.master.ads %>%
  mutate(
  ) %>%
  select(
    id,
    exposure,
    outcome.P1,
    age,
    sex,
    everything(),
  ) %>%
  ## Complete Case Set
  drop_na(
    exposure,
    outcome.P1,
  )
