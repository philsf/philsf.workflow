# Scripts to automate Statistical Analysis Reports (SAR)

The scripts in this repository standardize and automate the creation of individual git repositories for the creation of a Statistical Analysis Report (SAR).
They also simplify the synchronization between repo remotes, either in github/gitlab/etc, a network drive or a USB drive.


## Creation and management of a SAR repo

Essential scripts:

- `AE-new.sh` - Creates a new SAR dir (argument) in a sub-dir of the current dir
- `AE-remote-set.sh` - defines a remote for a SAR repo (in current dir)

Accessory scripts:

- `AE-basedirs.sh` - Creates the standardized dir structure for the SAR repo
- `AE-basefiles.sh` - Creates the stardized file structure for the SAR repo
- `AE-init.sh` - Initiates the SAR repo
- `AE-rename.sh` - Renames a SAR repo
- `AE-remote-rename.sh` - Rename a git remote, and update its reference

## Maintenance of a SAR repo

Essencial scripts:

- `sync-all-repos.sh` - Syncs all remotes in all dirs (dirs as arguments)

Accessory scripts:

- `sync-repo.sh` - syncs all remotes in the **current** dir (no arguments)

## Setup inicial de AEs

- `BM-setup.sh` - Cria a raiz de diretórios, e clona todas as AEs de um remoto
- `AE-remote-all-set.sh` - Configura um remoto para todas as AEs do dir atual

