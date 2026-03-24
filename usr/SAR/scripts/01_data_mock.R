# ************************************************************
# Script:   11_data_mock.R
# Purpose:  Creates the Mock Analysis Dataset (ADS).
#
# Note:     This dataset provides simulated data for study prep purposes.
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  YYYY-MM-DD
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

# Create Mock Data for Structural Integrity ------------------------------
# NOTE: This data frame must contain all variables used in ALL final tables (T1, T2, T3, etc.)
# It primarily serves to provide the correct variable labels and types.

n <- 100
data.mock.ads <- tibble(
  id = 1:n,
  exposure = factor(sample(c("Group A", "Group B"), n, replace = TRUE)), # Categorical exposure
  age = runif(n, 20, 60),                                                # Continuous covariate
  sex = factor(sample(c("Male", "Female"), n, replace = TRUE)),          # Categorical covariate
  outcome.P1 = rbinom(n, 1, .6), # Primary outcome 1
  outcome.S1 = rbinom(n, 1, .6), # Secondary outcome 1 (time-to-event example)
  outcome.S2 = rnorm(n),         # Secondary outcome 2 (continuous example)
  outcome.S3 = rbinom(n, 1, .4), # Secondary outcome 3
  outcome.E1 = rbinom(n, 1, .5), # Exploratory outcome 1
  time.E1    = rpois(n, 30),     # time-to-event for time-to-event outcome
) %>%
  # rowwise() %>%
  # mutate(
  #   # age = age + round(outcome.P1*2 + outcome.S1*2 + outcome.S2*2 + outcome.S3*2),
  #   outcome.P1 = round((outcome.P1 + (age>50)*.2 + (exposure =="Group B")*.25)),
  #   outcome.S1 = round((outcome.S1 + (age>50)*.2 + (exposure =="Group B")*.25)),
  #   outcome.S2 =      ((outcome.S2 + (age>40)*.2 + (exposure =="Group B")*.25)),
  #   outcome.S3 = round((outcome.S3 + (age>40)*.2 + (exposure =="Group B")*.20)),
  #   outcome.E1 = round((outcome.E1 + (age>40)*.2 + (exposure =="Group B")*.20)),
  #   outcome.P2 = if_else(exposure=="Group B", rbinom(1,1,.6), rbinom(1,1,.4)),
  # ) %>%
  # ungroup() %>%
  mutate(
    # outcome.P1 = factor(outcome.P1),
    # # outcome.S1 = factor(outcome.S1), # time-to-event stays numeric 0/1
    # # outcome.S2 = factor(outcome.S2), # continuous stays numeric
    # outcome.S3 = factor(outcome.S3),
    # outcome.E1 = factor(outcome.E1),
  ) %>%
  set_variable_labels(
    exposure = lab.exposure,
    outcome.P1 = lab.outcome.P1,
    outcome.S1 = lab.outcome.S1,
    outcome.S2 = lab.outcome.S2,
    outcome.S3 = lab.outcome.S3,
    outcome.E1 = lab.outcome.E1,
    age = lab.age,
    sex = lab.sex,
    time.E1 = lab.time.E1,
  )

# insert missing values
data.mock.ads[c(1,5), "exposure"] <- NA

data.master.ads <- data.mock.ads
