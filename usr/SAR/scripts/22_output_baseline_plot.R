# ************************************************************
# Script:   22_output_baseline_plot.R
# Purpose:  Create the Participant Characteristics figures.
#
# Note:     N/A
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-11-14
#
# ************************************************************
# QC Date:  YYYY-MM-DD
# ************************************************************

# Population Flowchart ----------------------------------------------------

gg.cohort_flow <- grViz(paste0("
digraph CONSORT {
  graph [layout = dot, rankdir = TB, nodesep = 0.6]

  # Global Node Styles
  node [fontname = Helvetica, shape = box, width = 3, style = filled, fillcolor = White]
  edge [fontname = Helvetica, arrowsize = 0.8]

  # Main Path Nodes
  node1 [label = 'Records identified in Source Data\\n(n = ", Nobs_orig, ")']
  node2 [label = 'Records after Inclusion 1 (xxx)\\n(n = ", Nobs_inc.crit1, ")']
  node3 [label = 'Records after Inclusion 2 (xxx)\\n(n = ", Nobs_inc.crit2, ")']
  node4 [label = 'Records after Inclusion 3 (xxx)\\n(n = ", Nobs_inc.crit3, ")']
  node5 [label = 'Study Population\\n(n = ", Nobs_final, ")', fillcolor = '#E8F5E9', penwidth = 2]

  # Exclusion Text (Invisible boxes to the right)
  excl1 [label = 'Removed after Exclusion 1: xxx\\n(n = ", Nobs_exc.crit1, ")']

# Invisible 'Point' nodes to create the T-junction
  node [shape = point, width = 0, label = '']
  p3

  # Define the Vertical Spine
  node1 -> node2
  node2 -> node3
  node3 -> node4
  node4 -> p1 [arrowhead = none]
  p1 -> node5

  # Define the Horizontal Branches
  { rank = same; p1; excl1 }

  # Connect the Branches
  p1 -> excl1 [style = dashed, constraint = false]
}
"))

gg.cohort_flow

# Age by Sex Figure (e.g., Figure A1) -------------------------------------

gg.appendix.age <- data.master.ads %>%
  gg.template() +
  aes(age, fill = sex) +
  geom_density(alpha = .9) +
  labs(
    x = attr(data.master.ads$age, "label"),
    y = "Distribution density",
    fill = attr(data.master.ads$sex, "label"),
    caption = paste0("N = ", style_number(Nobs_final)),
  )

gg.appendix.age

# cool facet trick from https://stackoverflow.com/questions/3695497 by JWilliman
# gg +
#   geom_histogram(bins = 5, aes(outcome, y = ..count../tapply(..count.., ..PANEL.., sum)[..PANEL..]), fill = ff.col) +
#   scale_y_continuous(labels = scales::label_percent(accuracy = 1)) +
#   xlab(attr(data.master.ads$outcome, "label")) +
#   ylab("") +
#   facet_wrap(~ exposure, ncol = 2)
