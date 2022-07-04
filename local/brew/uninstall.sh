#!/bin/sh

if [[ ! -d "$HOME/brew-install" ]]; then
  git clone --depth=1 https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/install.git brew-install
fi

/bin/bash brew-install/uninstall.sh
rm -rf brew-install