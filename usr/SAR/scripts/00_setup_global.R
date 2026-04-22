# ************************************************************
# Script:   00_setup_global.R
# Purpose:  Master script for setting up the environment.
#
# Note:     Library Loading, Theme and Options and Global Functions and Labels
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

# Libraries ---------------------------------------------------------------

## Input & Data

library(philsfmisc)
library(tidyverse)
library(labelled)
library(readxl)
# library(haven)
# library(foreign)
# library(RSQLite)
# library(data.table)
library(here)

## Describe

library(gtsummary)
library(gt)
# library(gtreg)
# library(Hmisc) # describe
# library(skimr) # skim
# library(gmodels) # CrossTable
# library(effectsize) # For Cohens d
# library(finalfit) # missing_compare

## Model

library(broom)
library(emmeans)
library(performance)
# library(car)
# library(MASS)
# library(rms)
# library(logbin)
# library(risks)
# library(survival)
# library(tidycmprsk)
# library(srvyr)
# library(survey)
# library(lmerTest)
# library(lme4)
# library(broom.mixed)
# library(VGAM)
# library(mgcv)
# library(mlogit)
# library(sandwich)
# library(AER)
# library(WeightIt)
# library(MatchIt)
# library(moderndive) # geom_parallel_slopes
# library(meta)
# library(metafor)

### Missing data
# library(naniar)
# library(simputation)
# library(mice)

## Inference

# library(infer)

## Plot

# library(ggfortify) # autoplot
library(ggeffects) # ggpredict
library(DiagrammeR)
# library(vcd)
# library(survminer)
# library(gridExtra)
# library(gghighlight)
# library(ggpubr) # ggarrange

## Output

library(writexl)
# library(officer)
# library(flextable)
library(knitr, include.only = "kable")
# library(patchwork)
# library(openxlsx)
# library(modelsummary)

## Power

## basic tests
# library(pwr)

## basic Epi
# library(pwrss)          # OR: pwrss.z.logreg()
# library(epiR)           # RR: epi.sscohortc(), IRR: epi.sscohortt()

## precision/margin of error
# library(presize)        # prec_prop(), prec_rate(), prec_riskdiff()

## survival
# library(gsDesign)       # headache 1
# library(powerSurvEpi)

## diagnostic tests
# library(pROC)           # power.roc.test()
# library(epiR)           # epi.ssdxsesp()
# library(MKpower)        # ssize.sens.ci()

## complex designs
# library(WebPower)       # cluster random: wp.crt2arm(), longitud/repeated wp.mmrm()
# library(TrialSize)      # Crossover, Non Inferiority
# library(simr)           # headache 2
# library(pwr2)           # factorial anova

## soft dependencies - required by some loaded packages
# library(webshot2) # save gtsummary/gt as images
# library(see)    # performance
# library(DHARMa) # performance
# library(rlang)  # tab()
# library(DiagrammeRsvg)
# library(rsvg)

# Project language --------------------------------------------------------

# Select one language to uncomment. All gtsummary default text will be translated.
# NOTE: This does NOT translate custom column headers or captions.

# Set the global workflow language using an R option.
# UNCOMMENT ONLY ONE language option:
options(workflow.language = "en") # Default (English)
# options(workflow.language = "pt") # Portuguese

# Global Variables --------------------------------------------------------

# Set random seed
set.seed(42)

# Define Plot Parameters
fig.height <- 12
fig.width <- 12
fig.units <- "cm"
fig.dpi    <- 300
fig.device <- "png" # Use "pdf" or "tiff" for publication

# Helper Functions --------------------------------------------------------

# Global Table Functions (tab, tab_adj)
# Helper functions to consistently format model outputs (31-, 41-, 51-)

# Function to create a simple table from a single model
tab <- function(model, include = NULL, exponentiate=FALSE, digits = 3, footnote=NA_character_, ...) {
  # 1. Determine the 'include' argument
  if (is.null(include)) {
    # If the default (NULL) is passed, force 'everything()' for the selection
    include_selection <- rlang::expr(everything())
  } else if (is.character(include)) {
    # If a character vector is passed (e.g., c("age", "sex")), use any_of()
    include_selection <- rlang::expr(any_of(!!include))
  } else {
    # If it is another NSE symbol (e.g., starts_with), use the passed expression
    include_selection <- rlang::enquo(include)
  }
  model %>%
    tbl_regression(
      exponentiate = exponentiate,
      include = !!include_selection, # Unquotes and injects the resolved selection
      # estimate_fun = purrr::partial(style_ratio,  digits = digits),
      # label = list(exposure = lab.exposure),
      ...,
    ) %>%
    # Bolding makes for poor outputs when exporting to Excel - use only within Rmarkdown
    # bold_p() %>%
    # add_n() %>%
    modify_footnote_header(footnote = footnote, columns = estimate, replace = FALSE)
}

# Function to create a table with crude and adjusted models
tab_adj <- function(crude, adjusted, include=NULL, exponentiate=FALSE, footnote=NA_character_, adjusted_for=NA_character_, digits = 3,...) {
  # "Adjusted for" footnote
  if(!is.na(adjusted_for)) adjusted_for <- paste(lab.adjusted_for, adjusted_for)

  # This uses the list of tables and the labels (lab.model.raw/adj)
  tbl_merge(
    list(
      tab(crude,    include=include, exponentiate=exponentiate, digits = digits, ...),
      tab(adjusted, include=include, exponentiate=exponentiate, digits = digits, ...)
    ), c(lab.model.raw, lab.model.adj),
    quiet = TRUE,
  ) %>%
    modify_footnote_header(footnote, columns = contains("estimate"), replace = FALSE) %>%
    modify_footnote_header(adjusted_for, columns = estimate_2, replace = FALSE)
}

effect_plot <- function(model, outcome = "outcome", exposure = "exposure", ...) {

  # 1. Obtain Estimated marginal Means (EMMs) conditional to the Exposure
  predicted_values <- ggeffects::ggpredict(model, terms = c(exposure), ...)

  # 2. Obtain the outcome label from the model
  if (class(model) %in% c("lmerModLmerTest", "lmerMod", "glmerMod")) {
    lab.outcome  <- model %>% augment() %>% pull(outcome ) %>% var_label()
    lab.exposure <- model %>% augment() %>% pull(exposure) %>% var_label()
  } else {
    lab.outcome  <- labelled::var_label(model$model[[outcome]])
    lab.exposure <- labelled::var_label(model$model[[exposure]])
  }

  # 3. Create plot with points and errors
  predicted_plot <- predicted_values %>%
    gg.template() + # standardize visual identity for all plots in gg.template() function
    aes(x = x, y = predicted, color = x) +

    # Add estimated means (position adjusted to avoid overlap)
    geom_point(size = 5, position = position_dodge(width = 0.5)) +

    # Add error bars (95% CI)
    geom_errorbar(aes(ymin = conf.low, ymax = conf.high, group = group),
                  width = 0.1, position = position_dodge(width = 0.5)) +

    # Plot labels
    labs(
      x = lab.exposure,
      y = paste("Predicted values of", lab.outcome),
      color = "",
      caption = paste0("N = ", style_number(nobs(model))),
    ) +

    # Theme and color configuration
    # Paleta ColorBrewer (Set1) para X e Y, mantendo V0 em cinza neutro
    # scale_color_manual(values = c("V0" = "#9ca3af", "X" = "#377EB8", "Y" = "#E41A1C")) +
    # scale_x_discrete(labels = c("0.5" = "Dose 0,5ml", "1.0" = "Dose 1,0ml", "1.5" = "Dose 1,5ml")) +
    # theme_ff() + # use gg.template() from now on
    theme(
      plot.title = element_text(face = "bold", size = 14),
      legend.position = "none",
      axis.title.x = element_text(size = 11, margin = margin(t = 10))
    )

  return(predicted_plot)
}

# Automatically renders a gtsummary object as a kable (for Rmd/PDF)
# or as a flextable (for DOCX), handling the caption appropriately.
# The function constructs the bolded table label (e.g., "**Table 2**")
# and ensures it is correctly bolded in DOCX output using flextable's
# native formatting, avoiding the need for regex parsing.
render_table <- function(table_object, table_index, caption) {

  # 1. Construct the complete caption string parts
  table_label <- paste0("Table ", table_index)

  if (knitr::is_html_output() || knitr::is_latex_output()) {
    # Render as kable for HTML, PDF, and general Markdown output

    # Use the full Markdown string for kable/PDF output (where it works)
    caption_text_md <- paste0("**", table_label, "** ", caption)

    table_object %>%
      gtsummary::as_kable(
        caption = gt::md(caption_text_md)
      )
  } else {
    # DOCX output (word_document) - Apply fixes for width, alignment, and formatting

    # ARTIFACT FIX - Caption SOLUTION for flextable:
    # Use simple plain text to prevent rich text object artifacts.
    # NOTE: Bolding of the 'Table X' label must be done manually in the DOCX.
    caption_text_plain <- paste0(table_label, " ", caption)

    ft <- table_object %>%
      gtsummary::as_flex_table() %>%

      # (Caption): Use plain text with flextable to avoid rendering artifacts
      flextable::set_caption(caption = caption_text_plain) %>%

      # (Width): Use layout="autofit" and width=1.0 (100%) to force
      # the table to span the full text width, overriding column calculations
      flextable::set_table_properties(width = 1.0, layout = "autofit") %>%

      # (Alignment): Ensure all cells are vertically centered
      flextable::valign(valign = "center", part = "all")

    return(ft)
  }
}

get_diagnostics <- function(model, label) {
  # capture model diagnostics that need to be available for the report
  bind_cols(
    model = label,
    model %>% r2() %>% as_tibble(),
    # model %>% icc() %>% as_tibble() %>% select(-optional),
    # model %>% check_normality() %>% as_tibble() %>% transmute(p.value=as.numeric(value)),
  )
}

get_vif <- function(model) {
  model %>%
    check_collinearity() %>%
    as_tibble() %>%
    select(Term:VIF)
}

# Override defaults from gtsummary
style_percent <- function(x, digits = 1, suffix = "%", ...) {
  gtsummary::style_percent(x, digits = digits, suffix = suffix, ...)
}

# Modeling ----------------------------------------------------------------

formula.primary.P1.raw     <- outcome.P1 ~ exposure
formula.primary.P1.adj     <- outcome.P1 ~ exposure + age + sex
formula.secondary.S1.raw   <- outcome.S1 ~ exposure
formula.secondary.S1.adj   <- outcome.S1 ~ exposure + age + sex
formula.secondary.S2.raw   <- outcome.S2 ~ exposure
formula.secondary.S2.adj   <- outcome.S2 ~ exposure + age + sex
formula.secondary.S3.raw   <- outcome.S3 ~ exposure
formula.secondary.S3.adj   <- outcome.S3 ~ exposure + age + sex
formula.exploratory.E1.raw <- outcome.E1 ~ exposure
formula.exploratory.E1.adj <- outcome.E1 ~ exposure + age + sex
# formula.exploratory.E1.raw <- Surv(time.E1, outcome.E1) ~ exposure
# formula.exploratory.E1.adj <- Surv(time.E1, outcome.E1) ~ exposure + age + sex

# Exponentiate
exp.outcome.P1 <- TRUE
exp.outcome.S1 <- TRUE
exp.outcome.S2 <- FALSE
exp.outcome.S3 <- TRUE
exp.outcome.E1 <- TRUE

# Labels ------------------------------------------------------------------

# General purpose template labels
if (getOption("workflow.language") == "pt") {
  theme_gtsummary_language(language = "pt")
  lab.model.raw    <- "Não-Ajustado"
  lab.model.adj    <- "Ajustado"
  lab.adjusted_for <- "Ajustado por"
  ci.sep           <- " até "
} else {
  theme_gtsummary_language(language = "en") # default
  lab.model.raw    <- "Unadjusted"
  lab.model.adj    <- "Adjusted"
  lab.adjusted_for <- "Adjusted for"
  ci.sep           <- " to "
}

# Exposure
lab.exposure   <- "Study exposure"
lab.time.E1    <- "Follow-up time for exploratory outcome 1 (years)"

# Primary Outcomes
lab.outcome.P1 <- "Study primary outcome 1"

# Secondary Outcomes
lab.outcome.S1 <- "Study secondary outcome 1"
lab.outcome.S2 <- "Study secondary outcome 2"
lab.outcome.S3 <- "Study secondary outcome 3"

# Exploratory Outcomes
lab.outcome.E1 <- "Study exploratory outcome 1"

# Covariates & Time
lab.age        <- "Age (years)"
lab.sex        <- "Sex"
lab.time       <- "Follow-up time (weeks)"

# Adjusted for
lab.rhs.adj     <- paste0(lab.sex, " and ", lab.age)

# Abbreviations
abbr.bmi   <- "BMI = Body Mass Index"

# Themes and Options ------------------------------------------------------

# setup gtsummary theme
theme_ff_gtsummary()

# setup ggplot theme
theme_set(theme_ff())

ff.col <- "steelblue" # good for single groups scale  fill/color brewer
ff.pal <- "Paired"    # good for binary groups scale  fill/color brewer
# ff.pal <- "Blues"   # good for sequential groups    fill/color brewer
# ff.pal <- "Set1"    # good for discrete groups      fill/color brewer
# other palettes: "Blues" for sequential and "Set1" or viridis_d() for discrete

# A wrapper function to apply common theme elements to all plots
# Global Plot Template (gg.template)
gg.template <- function(data, ...) {
  # Initialize the plot with the data and the specific aesthetic mappings passed in '...'
  ggplot(data, ...) +
    # Add all global components (Scales and Theme)
    scale_color_brewer(palette = ff.pal) +
    scale_fill_brewer(palette = ff.pal) +
    # scale_fill_viridis_d() +                # discrete palette
    # scale_color_viridis_d() +               # discrete palette
    theme_ff()
}
