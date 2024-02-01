#!/bin/bash
# Defina a variável de ambiente MY_DOTS_FOLDER
MY_DOTS_FOLDER=$HOME/jacoba_dot

# Defina os aliases
dotdrop="$MY_DOTS_FOLDER/dotdrop.sh"
DOTGIT="git -C $MY_DOTS_FOLDER"
DOTSYNC="dotdrop update -f && $DOTGIT add -A && $DOTGIT commit -m 'automatic scheduled task' && $DOTGIT pull && $DOTGIT push"

# Execute o comando dotsync
$MY_DOTS_FOLDER/dotdrop.sh update -f && $DOTGIT add -A && $DOTGIT commit -m 'automatic scheduled task' && $DOTGIT pull && $DOTGIT push

notify-send echo "Deu bom, pelo q ta aparentando"
#EOF
