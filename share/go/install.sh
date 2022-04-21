#!/bin/sh
#
# Golang

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

echo "\n"
echo "${CYAN}#--------------------------------------------------------------------"
echo "# Golang"
echo "#--------------------------------------------------------------------${RESET}\n"

if test ! $(which go); then
  brew install go
fi

# user china proxy
export GO111MODULE=on
export GOPROXY=https://goproxy.cn

go get golang.org/x/tools/gopls@latest
