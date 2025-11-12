#!/bin/bash

# ============================================================
# Script:   philsf.workflow-release.sh
# Purpose:  Prepare the workflow for release by ensuring the most current
#           R Markdown templates and style files are available
#
# Note:     N/A
#
# Version:  0.xx.x
# Author:   Felipe Figueiredo
# Created:  2025-11-11
#
# ------------------------------------------------------------
# QC Date:  YYYY-MM-DD
# ------------------------------------------------------------
# ============================================================

echo "Updating templates that will be installed on next release."
/bin/cp -a inst/rmarkdown/templates/SAP_pt/skeleton/skeleton.Rmd usr/SAR/SAP_pt.Rmd
/bin/cp -a inst/rmarkdown/templates/SAP_pt/skeleton/misc/style_SAP_pt.docx usr/SAR/misc/

/bin/cp -a inst/rmarkdown/templates/SAP_en/skeleton/skeleton.Rmd usr/SAR/SAP_en.Rmd
/bin/cp -a inst/rmarkdown/templates/SAP_en/skeleton/misc/style_SAP_en.docx usr/SAR/misc/

/bin/cp -a inst/rmarkdown/templates/SAR_pt/skeleton/skeleton.Rmd usr/SAR/SAR_pt.Rmd
/bin/cp -a inst/rmarkdown/templates/SAR_pt/skeleton/misc/style_SAR_pt.docx usr/SAR/misc/

/bin/cp -a inst/rmarkdown/templates/SAR_en/skeleton/skeleton.Rmd usr/SAR/SAR_en.Rmd
/bin/cp -a inst/rmarkdown/templates/SAR_en/skeleton/misc/style_SAR_en.docx usr/SAR/misc/

