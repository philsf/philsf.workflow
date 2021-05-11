# Scripts to automate Statistical Analysis Reports (SAR)

The scripts in this repository standardize and automate the creation of individual git repositories for the creation of a Statistical Analysis Report (SAR).
They also simplify the synchronization between repo remotes, either in github/gitlab/etc, a network drive or a USB drive.


## Gestão de AEs

Essenciais:

- `AE-new.sh` - Cria uma nova AE (argumento) em um subdiretório do diretório atual
- `AE-remote-set.sh` - Define um remoto para a AE (diretório atual)

Acessórios:

- `AE-basedirs.sh` - Cria os arquivos mínimos da AE
- `AE-basefiles.sh` - Cria os diretóriso mínimos da AE
- `AE-init.sh` - Inicia o repositório da AE
- `AE-rename.sh` - Renomeia uma AE
- `AE-remote-rename.sh` - Renomeia os remotos, e atualiza suas referências

## Manutenção de AEs

Essenciais:

- `sync-all-repos.sh` - Sincroniza os diretórios passados como argumentos

Acessórios:

- `sync-repo.sh` - sincroniza o diretório **atual** com todos os remotos

## Setup inicial de AEs

- `BM-setup.sh` - Cria a raiz de diretórios, e clona todas as AEs de um remoto
- `AE-remote-all-set.sh` - Configura um remoto para todas as AEs do dir atual

