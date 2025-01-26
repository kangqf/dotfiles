#!/bin/sh

script_path=$(cd `dirname $0`; pwd)
base_path="$script_path/../.."
source "$base_path/lib/chalk.sh"
source "$base_path/lib/helper.sh"

#RED=$'\e[31m'
#GREEN=$'\e[32m'
#CYAN=$'\e[36m'
#RESET=$'\e[0m'

#echo "📦 Installing Oh-My-Zsh for you."
#echo ${GREEN}✔${RESET} "$@"

group "📦 Installing Oh-My-Zsh for you."

# 先配置 zsh 再配置 oh-my-zsh
# .zshenv -> .zprofile -> .zshrc -> .zlogin -> .zlogout

# 1. 配置 zsh 根目录环境变量 ZDOTDIR
info "1. import variable"
source "$base_path/pkg/ohmyzsh/env.sh"
if [[ ! -d $ZDOTDIR ]]; then
  info "mkdir for zsh dot ${ZDOTDIR}"
  mkdir -p ${ZDOTDIR}
fi

# 2. copy .zshrc .zprofile .zsh_history
info "2. config zsh path"
array=( zshrc zprofile zsh_history )
for element in ${array[*]}
do
  if [[ -f $HOME/.$element ]]; then
    if [[ -f $ZDOTDIR/.$element ]]; then
      warn "backup $element $ZDOTDIR/.$element -> $ZDOTDIR/.$element.`date +%F-%R:%S`"
      mv $ZDOTDIR/.$element $ZDOTDIR/.$element.`date +%F-%R:%S`
    fi
    info "copy $element $HOME/.$element -> $ZDOTDIR/.$element"
    cp $HOME/.$element $ZDOTDIR/.$element
    info "backup $element $HOME/.$element -> $HOME/.$element.`date +%F-%R:%S`"
    mv $HOME/.$element $HOME/.$element.`date +%F-%R:%S`
  fi
done

# 3. 安装oh-my-zsh
info "3. install oh-my-zsh"
if [[ ! -d "$ZSH" ]]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git /tmp/ohmyzsh || exit 1
  ZSH=$ZSH sh /tmp/ohmyzsh/tools/install.sh

  if [[ $? == 1 ]]; then
    fail "Oh My Zsh install failed"
  else
    ok "Oh My Zsh install Success"
  fi
else
  info "Oh My Zsh Installed in $ZSH"
fi

echo 'source $XDG_DATA_HOME/kdot/pkg/ohmyzsh/env.sh' >>  $HOME/.zshenv

# 4. 恢复 zsh 配置
info "4. restore zsh config"
cat $ZDOTDIR/.zshrc.pre-oh-my-zsh  >> $ZDOTDIR/.zshrc

source $ZDOTDIR/.zshrc
source $HOME/.zshenv

group "📦 Installing Oh-My-Zsh done"



# export ZSHDOTDIR=$XDG_CONFIG_HOME/zsh

#if [[ $(uname -m) == "arm64" ]]; then
#  cp $DOTDIR/etc/zsh/.zprofile $ZDOTDIR/.zprofile
#fi

#if [[ ! -f $HOME/.zshenv ]]; then
#  cp $HOME/.config/dotfiles/etc/zsh/.zshenv $HOME/.zshenv
#  source $HOME/.zshenv
#fi
#
#if [[ ! -d $ZDOTDIR/site-functions ]]; then
#  cp -R $DOTDIR/etc/zsh/site-functions $ZDOTDIR/site-functions
#fi



#if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
#  echo "安装 zsh-autosuggestions."
#  git clone https://github.com/zsh-users/zsh-autosuggestions.git $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions --depth=1 || exit 1
#
#  if [[ $? == 1 ]]; then
#    echo ${RED}✖${RESET} "zsh-autosuggestions"
#  else
#    echo ${GREEN}✔${RESET} "zsh-autosuggestions"
#  fi
#else
#  echo ${GREEN}✔${RESET} "zsh-autosuggestions"
#fi
#
#if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]]; then
#  echo "安装 zsh-syntax-highlighting."
#  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting --depth=1 || exit 1
#
#  if [[ $? == 1 ]]; then
#    echo ${RED}✖${RESET} "zsh-syntax-highlighting"
#  else
#    echo ${GREEN}✔${RESET} "zsh-syntax-highlighting"
#  fi
#else
#  echo ${GREEN}✔${RESET} "zsh-syntax-highlighting"
#fi
#
#if [[ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-completions" ]]; then
#  echo "安装 zsh-completions."
#  git clone https://github.com/zsh-users/zsh-completions $HOME/.oh-my-zsh/custom/plugins/zsh-completions --depth=1 || exit 1
#
#  if [[ $? == 1 ]]; then
#    echo ${RED}✖${RESET} "zsh-completions"
#  else
#    echo ${GREEN}✔${RESET} "zsh-completions"
#  fi
#else
#  echo ${GREEN}✔${RESET} "zsh-completions"
#fi
