#!/bin/zsh

set -e

# 导入库函数
source "$(pwd)/lib/chalk.sh"
source "$(pwd)/lib/helper.sh"

# 1. 判断当前shell 是否是zsh，不是的话就退出
shell=$(get_current_shell)
if [[ "${shell}" != zsh ]];
then
  fail "not support for ${shell}"
  exit 1
fi

# 2. 先导入 xdg 规范
source "$(pwd)/spec/xdg/env.sh"

# 3. copy 文件到指定目录
if [[ -d "$XDG_DATA_HOME/kdot" ]]; then
  warn "kdot dir -> $XDG_DATA_HOME/kdot existed, just update kdot"
  cp -rf $(pwd)/* "$XDG_DATA_HOME/kdot"
  ok "kdot 更新成功"
  exit 0
fi

info "first install kdot"
info "mkdir for kdot -> $XDG_DATA_HOME/kdot"
mkdir -p "$XDG_DATA_HOME/kdot"
cp -rf $(pwd)/* "$XDG_DATA_HOME/kdot"

# 4. 安装ohmyzsh
zsh "$XDG_DATA_HOME/kdot/pkg/ohmyzsh/install.sh"
source "$XDG_DATA_HOME/kdot/pkg/ohmyzsh/env.sh"
zsh "$XDG_DATA_HOME/kdot/pkg/ohmyzsh/config.sh"

# 5. 添加环境变量，确保重启终端后能找到kdot
echo 'source $XDG_DATA_HOME/kdot/pkg/kdot/env.sh' >> ${ZDOTDIR}/.zshrc
chmod -R u+x $XDG_DATA_HOME/kdot/bin

if ! command -v kdot >/dev/null 2>&1; then
  warn "请重启终端"
  exit 1
fi

ok "kdot 安装成功"
