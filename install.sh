#!/bin/zsh

set -e

# 导入库函数
script_path=$(cd `dirname $0`; pwd)
base_path="$script_path"
source "$base_path/lib/chalk.sh"
source "$base_path/lib/helper.sh"

# 1. 判断当前shell 是否是zsh，不是的话就退出
shell=$(get_current_shell)
if [[ "${shell}" != zsh ]];
then
  fail "not support for ${shell}"
  exit 1
fi

# 2. 先导入 xdg 规范
source "$base_path/spec/xdg/env.sh"

# 3. copy 文件到指定目录，如果存在该目录直接覆盖
if [[ -d "$XDG_DATA_HOME/kdot" ]]; then
  warn "kdot dir -> $XDG_DATA_HOME/kdot existed, just update kdot"
  cp -rf $(pwd)/* "$XDG_DATA_HOME/kdot"
  ok "kdot 更新成功"
  exit 0
fi

# 4. 首次安装 kdot
info "first install kdot"
info "mkdir for kdot -> $XDG_DATA_HOME/kdot"
mkdir -p "$XDG_DATA_HOME/kdot"
cp -rf $base_path/* "$XDG_DATA_HOME/kdot"

# 4. 添加环境变量，确保重启终端后能找到kdot
# 注意 zsh 的 .zshenv 只能放到 Home 下面，无法定制目录
cat $base_path/spec/xdg/env.sh >> $HOME/.zshenv
echo 'source $XDG_DATA_HOME/kdot/pkg/kdot/env.sh' >>  $HOME/.zshenv

chmod -R u+x $XDG_DATA_HOME/kdot/bin

if ! command -v kdot >/dev/null 2>&1; then
  warn "请重启终端"
  exit 1
fi

ok "kdot 安装成功"
