#!/bin/sh
#
# Git

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

cat <<EOF
${CYAN}
┌─────────────────────────────────── GitHub ──────────────────────────────────┐
│                         GitHub private permissions                          │
└─────────────────────────────────────────────────────────────────────────────┘
${RESET}
EOF

if [[ ! -f "$HOME/.config/gh/hosts.yml" ]]; then
  cp "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Home/.config/gh/hosts.yml" $HOME/.config/gh/hosts.yml
  echo ${GREEN}✔${RESET} "Add GitHub personal access token"
fi

if [[ ! -d "$HOME/.ssh" ]]; then
  cp -R "$HOME/Library/Mobile Documents/com~apple~CloudDocs/Home/.ssh" $HOME/.ssh
  echo ${GREEN}✔${RESET} "Add SSH key to my GitHub account"
fi

if [[ ! -d "$HOME/.config/git" ]]; then
  cp -R "$XDG_CONFIG_HOME/dotfiles/etc/git" $XDG_CONFIG_HOME/git
  echo ${GREEN}✔${RESET} "Global git configuration"
fi
