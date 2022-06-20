#!/bin/sh
#
# NeoVim

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

echo "\n"
echo "${CYAN}#--------------------------------------------------------------------"
echo "# NeoVim"
echo "#--------------------------------------------------------------------${RESET}\n"

# 安装 lua 环境
if test ! $(which ninja); then
  brew install ninja
fi

if test ! $(which nvim); then
  brew install neovim
fi

if [[ ! -d "$HOME/.config/nvim" ]]; then
  git clone https://github.com/RenChunhui/nvim.git $HOME/.config/nvim
fi

yarn global add bash-language-server
yarn global add vscode-langservers-extracted
yarn global add typescript-language-server
yarn global add @tailwindcss/language-server
yarn global add @volar/vue-language-server
yarn global add yaml-language-server
yarn global add pyright

if test ! $(which go); then
  brew install go
fi

go install golang.org/x/tools/gopls@latest

if [[ ! -d "$HOME/.config/nvim/lua-language-server" ]]; then
  cd $HOME/.config/nvim
  git clone https://github.com/sumneko/lua-language-server
  cd lua-language-server
  git submodule update --init --recursive
  cd 3rd/luamake
  sh ./compile/install.sh
  cd ../..
  ./3rd/luamake/luamake rebuild
fi
