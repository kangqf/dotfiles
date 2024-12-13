

## 安装方式
使用项目最外层的 install.sh 进行安装 

## 安装流程
1. 导入lib中的辅助函数
2. 判断当前shell 是否是zsh
3. 导入xdg 规范
4. 判断 kdot 目录是否存在，存在则进行更新后退出即可
5. 不存在则为首次安装，先创建文件夹并 copy 文件
6. 导入规范中的环境变量
7. kdot 环境变量导入脚本写入rc文件

## 环境变量 及 PATH
``` bash
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# source $XDG_DATA_HOME/kdot/pkg/kdot/env.sh
export KDOTDIR=$XDG_DATA_HOME/kdot
export KDOTPKGDIR=$XDG_DATA_HOME/kdot/pkg
export KDOTSYSDIR=$XDG_DATA_HOME/kdot/sys
export PATH="$KDOTDIR/bin:$PATH"
```
