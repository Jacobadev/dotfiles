#!/bin/bash

DOTREPO="/home/jacoba/jacoba_dot"

cd $DOTREPO &&
./dotdrop.sh update -f &&
git add -A &&
git commit -m "eae" &&
git pull &&
git push &
