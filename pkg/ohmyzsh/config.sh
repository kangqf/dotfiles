script_path=$(cd `dirname $0`; pwd)
base_path="$script_path/../.."
source "$base_path/lib/chalk.sh"
export ZSHDOTDIR=$XDG_CONFIG_HOME/zsh

if [[ ! -d $ZSHDOTDIR ]]; then
  info "mkdir for zsh dot ${ZSHDOTDIR}"
  mkdir -p ${ZSHDOTDIR}
fi

if [[ -f $HOME/.zshrc ]]; then
  info "copy zshrc $HOME/.zshrc -> $ZSHDOTDIR/.zshrc"
  cp $HOME/.zshrc $ZSHDOTDIR/.zshrc
  info "backup zshrc $HOME/.zshrc -> $HOME/.zshrc.`date +%F-%R:%S`"
  mv $HOME/.zshrc $HOME/.zshrc.`date +%F-%R:%S`
fi

if [[ ! -d "$ZSH" ]]; then
  git clone https://github.com/ohmyzsh/ohmyzsh.git /tmp/ohmyzsh || exit 1
  ZSH=$ZSH sh /tmp/ohmyzsh/tools/install.sh

  if [[ $? == 1 ]]; then
    echo ${RED}✖${RESET} "Oh My Zsh"
  else
    echo ${GREEN}✔${RESET} "Oh My Zsh"
  fi
else
  echo ${GREEN}✔${RESET} "Oh My Zsh"
fi

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

cat $base_path/pkg/ohmyzsh/env.sh >> $HOME/.zshenv

source $ZSHDOTDIR/.zshrc
