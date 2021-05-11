# Scripts to automate Statistical Analysis Reports (SAR)

The scripts in this repository standardize and automate the creation of individual git repositories for the creation of a Statistical Analysis Report (SAR).
They also simplify the synchronization between repo remotes, regardless of location (github/gitlab/etc, USB or network drive).


## Creation and management of a SAR repo

Essential scripts:

- `AE-new.sh` - Creates a new SAR dir (argument) in a sub-dir of the current dir
- `AE-remote-set.sh` - defines a remote for a SAR repo (in current dir)

Accessory scripts:

- `AE-rename.sh` - Renames a SAR repo
- `AE-remote-set.sh` - Creates and configures a SAR remote in a local/network dir

Used internally:

- `AE-init.sh`       - Initiates the SAR repo
- `AE-basedirs.sh`  - Creates the standardized  dir structure for the SAR repo
- `AE-basefiles.sh` - Creates the stardardized file structure for the SAR repo

## Maintenance of a SAR repo

Essencial scripts:

- `sync-repo.sh` - Syncs all remotes in the **current** dir (no arguments)
- `sync-all-repos.sh` - Syncs all remotes in all dirs (dirs as arguments)

Accessory scripts:

- `AE-remote-rename.sh` - Rename a git remote, and update its reference (also renames remote dir)
- `AE-remote-all-set.sh` - Batch creation and configuration of several SAR remotes
