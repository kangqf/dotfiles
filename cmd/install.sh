#!/bin/sh
#
# 安装脚本

#######################################
# 帮助
#######################################
usage() {
cat <<EOF
Usage: dot install [pkg]
Available Package:
  git       Git 环境
EOF
}

#######################################
# 入口
#######################################
main() {
  # 判断目标pkg 或者 是否存在，通过文件夹目录判断
  if [ ! -d "$KDOTPKGDIR/$1" ]; then
    echo "not support pkg $1"
    usage
  fi

  case $1 in
    '')
      dot install ohmyzsh
      ;;
    ohmyzsh)
      zsh $KDOTPKGDIR/$1/install.sh $2 $3 $4
      ;;
    help)
      usage
      ;;
  esac
}

main "$@"
