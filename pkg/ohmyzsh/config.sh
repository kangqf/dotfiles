source "$(pwd)/lib/chalk.sh"
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

cat $(pwd)/spec/xdg/env.sh >> $HOME/.zshenv
cat $(pwd)/pkg/ohmyzsh/env.sh >> $HOME/.zshenv

source $ZSHDOTDIR/.zshrc
