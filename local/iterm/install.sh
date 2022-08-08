#!/bin/sh
#
# iTerm2

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

cat <<EOF
${CYAN}
┌─────────────────────────────────── iTerm2 ──────────────────────────────────┐
│                             Awesomeone terminal                             │
└─────────────────────────────────────────────────────────────────────────────┘
${RESET}
EOF

if [[ ! -f $HOME/.hushlogin ]]; then
  cp $DOTPATH/etc/hushlogin $HOME/.hushlogin
  echo ${GREEN}✔${RESET} "Add hushlogin file"
fi

if [[ ! -f $XDG_CONFIG_HOME/tmux/tmux.conf ]]; then
  cp $DOTPATH/etc/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
  echo ${GREEN}✔${RESET} "Add tmux configuration file"
fi

# 退出时不显示提示
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# 自定义字体
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Normal Font' FiraMonoNerdFontComplete-Regular 14" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Non Ascii Font' FiraMonoNerdFontComplete-Regular 14" ~/Library/Preferences/com.googlecode.iTerm2.plist
echo ${GREEN}✔${RESET} "FiraMono Nerd Font"

# 导入主题
/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'Doom One' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$HOME/.config/dotfiles/etc/iterm2/DoomOne.itermcolors' 'Custom Color Presets':'Doom One'" ~/Library/Preferences/com.googlecode.iTerm2.plist
echo ${GREEN}✔${RESET} "Doom One Theme"

/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'XCode Dark' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$HOME/.config/dotfiles/etc/iterm2/XCodeDark.itermcolors' 'Custom Color Presets':'XCode Dark'" ~/Library/Preferences/com.googlecode.iTerm2.plist
echo ${GREEN}✔${RESET} "XCode Dark Theme"

/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'GitHub Dark' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$HOME/.config/dotfiles/etc/iterm2/GitHubDark.itermcolors' 'Custom Color Presets':'GitHub Dark'" ~/Library/Preferences/com.googlecode.iTerm2.plist
echo ${GREEN}✔${RESET} "GitHub Dark Theme"
