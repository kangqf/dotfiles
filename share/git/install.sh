#!/bin/sh
#
# Git

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

echo "\n"
echo "${CYAN}#--------------------------------------------------------------------"
echo "# Git"
echo "#--------------------------------------------------------------------${RESET}\n"

if ! command -v gh; then
  brew install gh
fi

gh auth login --with-token < ~/Library/Mobile\ Documents/com\~apple\~CloudDocs/Home/github-token.txt
