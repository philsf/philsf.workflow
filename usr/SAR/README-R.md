# Script Workflow Documentation

The analysis scripts follow a numbered, modular structure to ensure **traceability** and **performance**.

All final objects (models, tables, plots) are cached as `.rds` files in the `results/` directory after an initial run, allowing reports to knit almost instantaneously.

### 1. Analysis Workflow (The Control Panel)

To run a **fresh analysis** (e.g., if data or model parameters change):

1.  **Run `scripts/99_full_analysis_run.R`**
    * This script acts as the master controller.
    * It sources all necessary setup, data prep, and analysis scripts (e.g., `20-`, `23-`, plus the chosen gig: `21-` / `22-` or `24-`).
    * It finishes by running `95_cache_results.R`, saving all required objects (models, `tab.primary.desc`, `tab.primary.inf`, `gg.primary.outcome`) to the new **`results/`** directory.

### 2. Report Workflow (The Performance Gain)

To knit your SAR or SAP document **quickly** (without re-running the heavy analysis):

1.  The R Markdown document (`SAR_en.Rmd`, `SAP_en.Rmd`) **must source `scripts/96_load_cached_results.R`**.
    * This script bypasses all `2x-` analysis by loading the pre-calculated objects directly from `results/`.

### 3. Final Output Saving (Manual Step)

To save final, publication-ready output files (e.g., `.png`, `.pdf`, `.rtf`):

1.  Run the dedicated output scripts **manually** after the analysis is finalized.
    * Figures: `scripts/90_outputs_plots.R` (Saves final images to `figures/`).
    * Tables: `scripts/91_outputs_tables.R` (Renders and saves final tables to `report/tables/`).
