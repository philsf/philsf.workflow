# Scripts to automate Statistical Analysis Reports (SAR)

The scripts in this repository standardize and automate the creation of individual git repositories for the creation of a Statistical Analysis Report (SAR).
They also simplify the synchronization between repo remotes, regardless of location (github/gitlab/etc, USB or network drive).

## Management of a SAR repo

### Creation of a SAR repo

Essential scripts:

- `SAR-new` - Creates a new SAR dir (argument) in a sub-dir of the current dir
- `SAR-remote-set` - defines a remote for a SAR repo (in current dir)

Accessory scripts:

- `SAR-rename` - Renames a SAR repo
- `SAR-remote-set` - Creates and configures a SAR remote in a local/network dir

Used internally:

- `SAR-init`       - Initiates the SAR repo
- `SAR-basedirs`  - Creates the standardized  dir structure for the SAR repo
- `SAR-basefiles` - Creates the stardardized file structure for the SAR repo

### Maintenance of a SAR repo

Essencial scripts:

- `SAR-sync` - Syncs all remotes in the **current** dir (no arguments)
- `SAR-sync-all` - Syncs all remotes in all dirs (dirs as arguments)

Accessory scripts:

- `SAR-remote-rename` - Rename a git remote, and update its reference (also renames remote dir)
- `SAR-remote-set-all` - Batch creation and configuration of several SAR remotes

## Document templates

A few R Markdown templates are provided suitable for SAR, SAP and general study protocols.

- **SAR_pt** - Statistical Analysis Report (pt)
- **SAR_en** - Statistical Analysis Report (en)
- **SAP_pt** - Analytical Plan (pt)
- **SAP_en** - Analytical Plan (en)

It includes a reference docx with pre-formatted styles for easy creation of professional reports or SAPs, in brazilian portuguese (pt) and english (en).
These reference styles docx includes a template `URL` pointing to a `philsf-biostat` organization repository.

The SAP template was elaborated following [recommendations on the structure for Statistical Analysis Plans](https://doi.org/10.1001/jama.2017.18556) for better transparency and clarity.
