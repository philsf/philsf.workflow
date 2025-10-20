# Preamble ----------------------------------------------------------------
# Purpose: Master script for setting up the environment.
# Library Loading, Theme and Options and Global Functions and Labels

# input & data ------------------------------------------------------------

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

# describe ----------------------------------------------------------------

# library(Hmisc) # describe
# library(skimr) # skim
# library(gmodels) # CrossTable
library(gtsummary)
library(gt)
# library(gtreg)
# library(effectsize)
# library(finalfit) # missing_compare

# model -------------------------------------------------------------------

# library(moderndive) # geom_parallel_slopes
library(broom)
library(emmeans)
# library(lmerTest)
# library(lme4)
# library(broom.mixed)
# library(mlogit)
# library(simputation)
# library(mice)
library(ggfortify) # autoplot
# library(ggeffects)
# library(car)
# library(MASS)
# library(rms)
# library(performance)

# inference ---------------------------------------------------------------

# library(infer)

# plot --------------------------------------------------------------------

# library(survminer)
# library(gridExtra)

# setup themes ------------------------------------------------------------

# setup gtsummary theme

theme_ff_gtsummary()
theme_gtsummary_compact()
# theme_gtsummary_language(language = "pt") # traduzir

theme_set(theme_ff())

# global variables --------------------------------------------------------

# do we exponentiate results (OR/RR)?
exponentiate <- FALSE

# helper functions --------------------------------------------------------

tab <- function(model, include = everything(), exp=exponentiate, digits = 3, ...) {
  model %>%
    tbl_regression(
      exp = exp,
      include = all_of(include),
      # estimate_fun = purrr::partial(style_ratio,  digits = digits),
      label = list(exposure = lab.exposure, dose = lab.dose),
      ...,
    ) %>%
    add_n()
    # bold_p()
}

tab_adj <- function(crude, adjusted, include=everything(), exp=exponentiate, digits = 3, ...) {
  tbl_merge(
    list(
      tab(crude,    include=include, exp=exp, digits = digits, ...),
      tab(adjusted, include=include, exp=exp, digits = digits, ...)
      ), c("Unadjusted", "Adjusted")
  )
}

effect_plot <- function(model, plot_title, y_label) {

  # 1. Obter as Médias Marginais Estimadas (EMMs) condicionadas à Dose e Exposição
  # A ordem c("dose", "exposure") garante que 'x' seja dose e 'group' seja exposure
  predicted_values <- ggpredict(model, terms = c("dose", "exposure"))

  # 2. Gerar o Gráfico de Pontos e Erros (Sem Linhas)
  predicted_plot <- ggplot(predicted_values, aes(x = x, y = predicted, color = group)) +

    # Adiciona os pontos das médias estimadas (posicionamento ajustado para não se sobreporem)
    geom_point(size = 3, position = position_dodge(width = 0.5)) +

    # Adiciona as barras de erro (IC 95%)
    geom_errorbar(aes(ymin = conf.low, ymax = conf.high, group = group),
                  width = 0.1, position = position_dodge(width = 0.5)) +

    # Rótulos e Títulos
    labs(
      x = "Dose",
      y = paste("Valor predito de", plot_title),
      # title = paste("Médias Estimadas de", plot_title, "por Exposição e Visita"),
      color = "Exposição"
    ) +

    # Configurações de cores e tema
    # Paleta ColorBrewer (Set1) para X e Y, mantendo V0 em cinza neutro
    scale_color_manual(values = c("V0" = "#9ca3af", "X" = "#377EB8", "Y" = "#E41A1C")) +
    scale_x_discrete(labels = c("0.5" = "Dose 0,5ml", "1.0" = "Dose 1,0ml", "1.5" = "Dose 1,5ml")) +
    theme_ff() +
    theme(
      plot.title = element_text(face = "bold", size = 14),
      legend.position = "top",
      axis.title.x = element_text(size = 11, margin = margin(t = 10))
    )

  return(predicted_plot)
}

# Modeling ----------------------------------------------------------------

model.primary.formula <- outcome ~ exposure + age + sex

# labels ------------------------------------------------------------------

# Naming convention for the Master ADS
master.ads.name <- "data.ads"

lab.exposure <- "Study exposure"
lab.primary.outcome <- "Study primary outcome"
