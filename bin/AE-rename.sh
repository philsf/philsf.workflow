#!/bin/bash

if [[ "$1" == "" ]]
then
    echo "Uso: AE-rename.sh AE_NEW"
    exit
fi

OLD_AE=${PWD##*/} # local dir
NEW_AE=$1

echo "Renaming $OLD_AE to $NEW_AE"
cd ..
error=$(mv "$OLD_AE" "$NEW_AE" 2>&1) || echo "Erro ao renomear repositório: $error"
cd "$NEW_AE" || { echo "Erro ao entrar no repositório"; exit 1; }
error=$(mv "$OLD_AE.Rproj" "$NEW_AE.Rproj" 2>&1) || echo "Erro ao renomear RStudio Project: $error"
echo "# $NEW_AE" > README.md && echo "README atualizado" || echo "Erro ao atualizar README."

echo "Remotos disponíveis para atualização:"
for REMOTE in $(git remote)
do
    # AE-remote-rename.sh $NEW_AE $REMOTE
    echo "$REMOTE: " $(git remote get-url $REMOTE)
done
