# ************************************************************
# Template: QC-Checklist-4-Analysis.md
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2026-03-24
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

Focus: Statistical validity and presentation readiness.

- ADS Integrity:
    - [ ] Check what variables are included in `drop_na()` for complete cases.
    - [ ] Factor levels/Reference categories explicitly set.
- Model quality:
    - [ ] Save R2 for the report
    - [ ] No "Singular fit" warnings (LMM).
    - [ ] No "Perfect separation" (Logistic).
    - [ ] `check_model()` reviewed for standard violations (Homoscedasticity, Normality).
    - [ ] Overdispersion checked for Poisson (`AER::dispersiontest`).
- [ ] Set "Adjusted for" and Footnote strings in all analyses tables
- Figures
    - [ ] Check figures' axes and labels/colors
    - [ ] Check that correct variable type is being passed to ggplot (factor, continuous, missing as factor level)
