# Scripts para gestão de AEs do LATEV

Os scripts deste repositório padronizam e automatizam a criação de repositórios para AEs, bem como a sincronização entre o repositório local, e o remoto no drive `S:`.

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

