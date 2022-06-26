#!/bin/sh
#
# Uninstall NeoVim

rm -rf $HOME/.config/nvim

yarn global remove bash-language-server
yarn global remove vscode-langservers-extracted
yarn global remove typescript-language-server
yarn global remove @tailwindcss/language-server
yarn global remove @volar/vue-language-server
yarn global remove yaml-language-server
