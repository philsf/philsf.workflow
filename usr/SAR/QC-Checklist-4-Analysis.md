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
    - [ ] Correct variables are included in `drop_na()` for complete cases.
    - [ ] Factor levels/Reference categories explicitly set following SAP specification.
- Models:
    - [ ] Scope: `exponentiate` flag for every model
    - [ ] Overview: `check_model()` for standard violations (Homoscedasticity, Normality).
    - [ ] Diagnostics: Implement and cache model metrics (R², VIF, ICC, Normality, c-statistic, etc) following the SAP specification.
    - [ ] Linear: Residuals Normal distribution (Shapiro-Wilk or QQ-plot)
    - [ ] Logistic: No "Perfect separation"
    - [ ] Poisson: Overdispersion checked (`AER::dispersiontest()`).
    - [ ] LMM/GLMM: No "Singular fit" warnings.
- Outputs:
    - [ ] Tables: All tables correctly pull the labels defined in the setup/SAP.
    - [ ] Tables: "Adjusted for" and global footnote strings in all tables.
    - [ ] Tables: Every abbreviation used in the output (including variables and statistical terms like ICC or VIF) is defined in the respective table footnotes.
    - [ ] Tables: Participant count (N) is accurate, where applicable.
    - [ ] Figures: All plot axes correctly pull the labels defined in the setup/SAP.
    - [ ] Figures: Axes and labels/colors are appropriate for purpose.
    - [ ] Figures: The correct variable type is being passed to ggplot (factor, continuous, missing as factor level)
    - [ ] Figures: Participant count (N) is accurate, where applicable.
    - [ ] Figures: All output plots (PNG) have appropriate resolution to display all labels
