
# 获取当前shell
get_current_shell() {
  # Darwin: dscl . -read  /Users/$USER UserShell|cut -d' ' -f2
  # Linux: echo $SHELL
  shell=$(ps -o pid,comm | awk "\$1 == $$ { print \$2 }" | awk -F'/' '{print $NF}')
  echo $shell
}

get_current_path() {
  base_path=$(cd `dirname $0`; pwd)
  echo $base_path
}


