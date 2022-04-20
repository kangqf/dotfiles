#!/bin/sh

if [[ ! -f "$HOME/.zshenv" ]]; then
  cp $HOME/.config/dotfiles/etc/zshenv $HOME/.zshenv
fi

chmod -R u+x $HOME/.config/dotfiles/bin

if ! command -v dot >/dev/null 2>&1; then
  echo "请重启终端"
  exit 1
fi

dot install
sudo -v
@while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
