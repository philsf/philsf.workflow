# ************************************************************
# Script:   05_sample_size.R
# Purpose:  Sample size calculation or Precision/Power analysis.
#
# Note:     N/A
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2026-03-18
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************


# The Scenario: Assumptions

# Group 0 (Unexposed): Baseline Risk of 10% (P_0 = 0.10).
# Effect Size: We want to detect a 2.0 increase (RR = 2.0, OR \approx 2.25, IRR = 2.0).
# Alpha/Power: 5% significance, 80% power.
# Ratio: 1:1 allocation ($r = 1$).

library(epiR)

# Scenario: Baseline 10%, Risk Ratio 2.0 (Risk 20%), 80% Power
# irexp0: Risk in unexposed (0.10)
# irexp1: Risk in exposed (0.20)
# n = NA: Tells the function "I don't know N, please calculate it"
# power = 0.80: Target power
# r = 1: 1:1 allocation

res_rr <- epi.sscohortc(
  irexp0 = 0.10,
  irexp1 = 0.20,
  n = NA,
  power = 0.80,
  r = 1
)

print(res_rr$n.total) # Total N needed

# IRR Calculation (Rates per person-year)
# irexp0: Rate in unexposed (0.10)
# irexp1: Rate in exposed (0.20)
# n = NA: Solver flag
# power = 0.80
# r = 1: 1:1 allocation

res_irr <- epi.sscohortt(
  irexp1 = 0.20,
  irexp0 = 0.10,
  n = NA,
  power = 0.80,
  r = 1
)

print(res_irr$n.total) # Total Person-Time needed

library(pwrss)

# p0: Base probability (0.10)
# p1: Probability under alternative (0.20)
# power: 0.80
# distribution: "bernoulli" (Binary exposure/predictor)

res_or <- pwrss.z.logreg(p0 = 0.10,
                         p1 = 0.20,
                         power = 0.80,
                         distribution = "bernoulli")

# Total N is usually found in the output summary

library(presize)

# precision estimations
# obs: review CI methods: Wald, Wilson, Clopper-Pearson (exact) later, for use cases

# 1. PROPORTION (Prevalence/Incidence Risk)
# p = 0.10 (Expected 10% prevalence)
# conf.width = 0.10 (Total width; gives a margin of ± 0.05)
# method = "wald" (Standard) or "wilson" (More accurate for small p)
prec_prop(p = 0.10, conf.width = 0.10, method = "wilson")

# 2. INCIDENCE RATE (Events per Person-Time)
# x = Number of events (calculated by function)
# r = 0.05 (e.g., 5 events per 100 person-years)
# conf.width = 0.02 (Total width; gives a margin of ± 0.01)
prec_rate(r = 0.05, conf.width = 0.02, method = "wald")

# 3. RISK DIFFERENCE (Comparing Two Groups)
# p1 = 0.20, p2 = 0.10 (The 10% vs 20% scenario)
# conf.width = 0.10 (Total width; gives a margin of ± 0.05 around the 0.10 difference)
# r = 1 (Ratio of n1/n2)
prec_riskdiff(p1 = 0.20, p2 = 0.10, conf.width = 0.10, r = 1, method = "newcombe")

## cluster randomized trial

# The Scenario

# Goal: Test an intervention to reduce a continuous health outcome (like blood pressure).
# Setup: 2 arms (Intervention vs. Control).
# Clusters: You plan to recruit 20 clusters (10 per arm).
# Cluster Size: You expect to measure 50 people per cluster.
# Effect Size: A Cohen's d = 0.3 (small to medium effect).
# ICC: 0.05 (meaning 5% of the variation in blood pressure is due to which clinic the patient attends).

library(WebPower)

# n = 50 (Number of individuals WITHIN each cluster)
# f = 0.3 (Cohen's d effect size)
# power = 0.80: Target power
# J = NULL: Tells the function to solve for the number of clusters (TOTAL number of clusters across both arms)
# icc = 0.05 (Intraclass Correlation Coefficient)
# alpha = 0.05

res_cluster <- wp.crt2arm(
  n = 50,
  f = 0.3,
  power = 0.8,
  # J = NULL,
  icc = 0.05,
  alpha = 0.05
)

print(res_cluster)

# If you want to know how many people you need to recruit to prove that a new rapid test has a Sensitivity of 90% with a specific margin of error:
library(epiR)

# se: Sensitivity (0.90)
# sp: Specificity (0.95)
# Py: Prevalence (0.20)
# epsilon: Precision (0.05)
# error: "absolute" (to ensure the margin is +/- 0.05)

res_dx <- epi.ssdxsesp(
  se = 0.90,
  sp = 0.95,
  Py = 0.20,
  epsilon = 0.05,
  error = "absolute"
)

print(res_dx)

# If you are comparing two ROC curves (e.g., "Is the new biomarker better than the old one?"), the pROC package is the standard. It has a built-in power function that doesn't require simulation.
library(pROC)

# parslist: A list containing the two AUCs to compare
# ncases/ncontrols = NULL: Tells the function to solve for sample size
# kappa = 1: 1:1 ratio of cases to controls

res_roc <- power.roc.test(
  auc = 0.85,
  delta = 0.10,
  power = 0.80,
  sig.level = 0.05,
  kappa = 1,
  ncases = NULL
)

print(res_roc)

library(MKpower)

# sens = 0.90 (Target)
# delta = 0.05 (We want the lower bound to be at least 0.85)
# power = 0.80 (To be 80% sure the CI lower bound is above 0.85)
# prev = 0.20 (20% disease prevalence)

res_sens <- ssize.sens.ci(
  sens = 0.90,
  delta = 0.05,
  power = 0.80,
  prev = 0.20,
  method = "asymptotic"
)

print(res_sens)

# 1. Crossover Trials

# The Task: You want to detect a difference of 5 units in a continuous outcome (e.g., systolic blood pressure) with a standard deviation of 10.

library(TrialSize)

# delta: the difference to detect (5)
# sigma: standard deviation (10)
# alpha: 0.05
# beta: 0.20 (for 80% power)

Crossover.PointEstimates.Size(delta = 5, sigma = 10,
                              alpha = 0.05, beta = 0.20)

# 2. Non-Inferiority (NI)

# The Scenario (Proportions):
# Standard Treatment Success: 80% (P_1 = 0.80)
# New Treatment Success: 80% (P_2 = 0.80)
# NI Margin: 10% (margin = 0.10). You want to prove the new treatment isn't more than 10% worse than the old one.

# P1: Success rate of standard
# P2: Success rate of new
# margin: The NI margin (delta)
# One-sided test is standard for NI

TwoSampleProportion.NonInferiority(p1 = 0.80, p2 = 0.80,
                                   margin = 0.10,
                                   alpha = 0.05, beta = 0.20)

# THE SCENARIO:
# 1. Control: 30% cumulative incidence of the event at 3 years (mc = 0.3, tref = 3).
# 2. Effect: Target Hazard Ratio (HR) of 0.70.
#    Note: Hmisc uses 'r' as % reduction (1 - HR), so HR 0.70 = 30% reduction.
# 3. Setup: Total N=1000, 1:1 allocation, 5% alpha (two-sided).
# 4. Timeline: 1-year accrual period + 2-year minimum follow-up (Total = 3 years).

library(Hmisc)

cpower(
  tref    = 3,    # Reference time for the 'mc' mortality estimate
  n       = 1000, # Total sample size (both groups combined)
  mc      = 0.3,  # Control group cumulative mortality at 'tref'
  r       = 30,   # Percent reduction in hazard (100 * (1 - HR))
  accrual = 1,    # Duration of the recruitment/enrollment period (years)
  tmin    = 2     # Follow-up time for the very last patient enrolled (years)
)

