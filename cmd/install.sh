#!/bin/sh

#######################################
# 帮助
#######################################
usage() {
cat <<EOF
Usage: dot install [command]
Available Commands:
  brew     Homebrew 安装
  git      Git 环境
  go       Golang 环境
  iterm    终端配置
  macos    系统偏好设置
  neovim   NeoVim 配置
  node     Node 环境
  vscode   VSCode 开发环境
  zsh      zsh 环境
  help     帮助文档
EOF
}

#######################################
# 入口
#######################################
main() {
  case $1 in
    '')
      dot install zsh
      dot install brew
      dot install git
      dot install node
      dot install go
      dot install iterm
      dot install vscode
      dot install neovim
      dot install macos
      ;;
    brew)
      sh $DOTPATH/share/brew/install.sh
      ;;
    git)
      sh $DOTPATH/share/git/install.sh
      ;;
    go)
      sh $DOTPATH/share/go/install.sh
      ;;
    iterm)
      sh $DOTPATH/share/iterm/install.sh
      ;;
    macos)
      sh $DOTPATH/share/macos/install.sh
      ;;
    neovim)
      sh $DOTPATH/share/neovim/install.sh
      ;;
    node)
      sh $DOTPATH/share/node/install.sh
      ;;
    vscode)
      sh $DOTPATH/share/vscode/install.sh
      ;;
    zsh)
      sh $DOTPATH/share/zsh/install.sh
      ;;
    help)
      usage
      ;;
    *)
      echo "指定的命令无效. 请运行 dot install help."
      ;;
  esac
}

main "$@"
