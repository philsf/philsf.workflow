# ************************************************************
# Script:   20_data_baseline_ads.R
# Purpose:  Creates the Baseline Analysis Dataset (ADS).
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

data.baseline.ads <- data.master.ads %>%
  # add column for missing exposure
  mutate(exposure = fct_na_value_to_level(exposure, "Missing")) %>%
  select(
    everything()
  )
