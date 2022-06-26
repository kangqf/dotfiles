#!/bin/sh
#
# Homebrew

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

echo "\n"
echo "${CYAN}#--------------------------------------------------------------------"
echo "# Homebrew"
echo "#--------------------------------------------------------------------${RESET}\n"

if ! command -v brew >/dev/null 2>&1; then
  echo "  Installing Homebrew for you."

  export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git"
  export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
  export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.tuna.tsinghua.edu.cn/homebrew-bottles"

  git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git $HOME/brew-install
  /bin/bash $HOME/brew-install/install.sh
  rm -rf brew-install
fi

brew bundle --file=$DOTPATH/Brewfile
