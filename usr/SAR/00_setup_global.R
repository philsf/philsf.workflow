# ============================================================
# Script:   00_setup_global.R
# Purpose:  Master script for setting up the environment.
#
# Note:     Library Loading, Theme and Options and Global Functions and Labels
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-10-20
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

# Libraries ---------------------------------------------------------------

## Input & Data

library(philsfmisc)
# library(data.table)
library(tidyverse)
library(readxl)
# library(haven)
# library(foreign)
# library(lubridate)
library(naniar)
# library(survey)
library(labelled)
library(writexl)

## Describe

# library(Hmisc) # describe
# library(skimr) # skim
# library(gmodels) # CrossTable
library(gtsummary)
library(gt)
# library(gtreg)
# library(effectsize) # For Cohens d
# library(finalfit) # missing_compare

## Model

# library(moderndive) # geom_parallel_slopes
library(broom)
library(emmeans)
# library(lmerTest)
# library(lme4)
# library(broom.mixed)
# library(mlogit)
# library(AER)
# library(simputation)
# library(mice)
# library(car)
# library(MASS)
# library(rms)
library(performance)

## Inference

# library(infer)

## Plot

library(ggfortify) # autoplot
library(ggeffects) # ggpredict
# library(survminer)
# library(gridExtra)
# library(gghighlight)
# library(ggpubr) # ggarrange

# Output

# library(officer)
# library(flextable)
# library(knitr)
# library(patchwork)
# library(openxlsx)
# library(modelsummary)

# Project language --------------------------------------------------------

# Select one language to uncomment. All gtsummary default text will be translated.
# NOTE: This does NOT translate custom column headers or captions.

# Set the global workflow language using an R option.
# UNCOMMENT ONLY ONE language option:
options(workflow.language = "en") # Default (English)
# options(workflow.language = "pt") # Portuguese

# Themes and Options ------------------------------------------------------

# setup gtsummary theme
theme_ff_gtsummary()
theme_gtsummary_compact()
# theme_gtsummary_language(language = "pt") # moved to section labels

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

# gg.template <- list(
#   scale_color_brewer(palette = ff.pal),
#   scale_fill_brewer(palette = ff.pal),
#   # scale_fill_viridis_d(),
#   # scale_color_viridis_d(),
#   theme_ff())

# Global Variables --------------------------------------------------------

# Set random seed
set.seed(42)

# do we exponentiate results (OR/RR/HR)?
# TRUE for logistic/Poisson/Cox regression (OR, IRR, HR)
# FALSE for linear regression (mean difference)
exponentiate <- FALSE

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
tab <- function(model, include = NULL, exp=exponentiate, digits = 3, footnote=NA_character_, ...) {
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
      exp = exp,
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
tab_adj <- function(crude, adjusted, include=NULL, exp=exponentiate, footnote=NA_character_, adjusted_for=NA_character_, digits = 3,...) {
  # "Adjusted by" footnote
  if(!is.na(adjusted_for)) adjusted_for <- paste0(lab.model.adj, ": ", adjusted_for)

  # This uses the list of tables and the labels (lab.model.raw/adj)
  tbl_merge(
    list(
      tab(crude,    include=include, exp=exp, digits = digits, ...),
      tab(adjusted, include=include, exp=exp, digits = digits, ...)
    ), c(lab.model.raw, lab.model.adj),
  ) %>%
    modify_footnote_header(footnote, columns = contains("estimate"), replace = FALSE) %>%
    modify_footnote_header(adjusted_for, columns = estimate_2, replace = FALSE)
}

effect_plot <- function(model) {

  # 1. Obtain Estimated marginal Means (EMMs) conditional to the Exposure
  predicted_values <- ggeffects::ggpredict(model, terms = c("exposure"))

  # 2. Obtain the outcome label from the model
  lab.outcome  <- model %>% augment() %>% pull(outcome)  %>% var_label()
  lab.exposure <- model %>% augment() %>% pull(exposure) %>% var_label()

  # 3. Create plot with points and errors
  predicted_plot <- predicted_values %>%
    gg.template() + # standardize visual identity for all plots in gg.template() function
    aes(x = x, y = predicted, color = x) +

    # Add estimated means (position adjusted to avoid overlap)
    geom_point(size = 3, position = position_dodge(width = 0.5)) +

    # Add error bars (95% CI)
    geom_errorbar(aes(ymin = conf.low, ymax = conf.high, group = group),
                  width = 0.1, position = position_dodge(width = 0.5)) +

    # Plot labels
    labs(
      x = lab.exposure,
      y = paste("Predicted value of", lab.outcome),
    ) +

    # Theme and color configuration
    # Paleta ColorBrewer (Set1) para X e Y, mantendo V0 em cinza neutro
    # scale_color_manual(values = c("V0" = "#9ca3af", "X" = "#377EB8", "Y" = "#E41A1C")) +
    # scale_x_discrete(labels = c("0.5" = "Dose 0,5ml", "1.0" = "Dose 1,0ml", "1.5" = "Dose 1,5ml")) +
    # theme_ff() + # use gg.template() from now on
    theme(
      plot.title = element_text(face = "bold", size = 14),
      legend.position = "top",
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

# Modeling ----------------------------------------------------------------

formula.primary.raw     <- outcome ~ exposure
formula.primary.adj     <- outcome ~ exposure + age + sex
formula.secondary.raw   <- outcome ~ exposure
formula.secondary.adj   <- outcome ~ exposure + age + sex
formula.exploratory.raw <- outcome ~ exposure
formula.exploratory.adj <- outcome ~ exposure + age + sex

# Labels ------------------------------------------------------------------

# General purpose template labels
if (getOption("workflow.language") == "pt") {
  theme_gtsummary_language(language = "pt")
  lab.model.raw   <- "Não-Ajustado"
  lab.model.adj   <- "Ajustado"
} else {
  theme_gtsummary_language(language = "en") # default
  lab.model.raw   <- "Unadjusted"
  lab.model.adj   <- "Adjusted"
}

# Project-specific labels
lab.exposure            <- "Study exposure"
lab.primary.outcome     <- "Study primary outcome"
lab.secondary.outcome   <- "Study secondary outcome"
lab.exploratory.outcome <- "Study exploratory outcome"
lab.age                 <- "Age (years)"
lab.sex                 <- "Sex"
