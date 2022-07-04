#!/bin/sh
#
# NodeJS

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

echo "\n"
echo "${CYAN}#--------------------------------------------------------------------"
echo "# NodeJS"
echo "#--------------------------------------------------------------------${RESET}\n"

if ! command -v yarn; then
  brew install yarn
fi


