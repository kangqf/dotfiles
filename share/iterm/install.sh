#!/bin/sh
#
# iTerm2

RED=$'\e[31m'
GREEN=$'\e[32m'
CYAN=$'\e[36m'
RESET=$'\e[0m'

echo "\n"
echo "${CYAN}#--------------------------------------------------------------------"
echo "# iTerm2"
echo "#--------------------------------------------------------------------${RESET}\n"

cp $DOTPATH/etc/hushlogin $HOME/.hushlogin
cp $DOTPATH/etc/tmux.conf $HOME/.tmux.conf

# 退出时不显示提示
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# 自定义字体
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Normal Font' JetBrainsMonoNerdFont-Regular 13" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Non Ascii Font' JetBrainsMonoNerdFont-Regular 13" ~/Library/Preferences/com.googlecode.iTerm2.plist

# 导入主题
# /usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'DoomOne' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
# /usr/libexec/PlistBuddy -c "Merge '$HOME/.config/dotfiles/pkgs/iterm/themes/DoomOne.itermcolors' 'Custom Color Presets':'DoomOne'" ~/Library/Preferences/com.googlecode.iTerm2.plist

# /usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'DoomOne' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
# /usr/libexec/PlistBuddy -c "Merge '$HOME/.config/dotfiles/pkgs/iterm/themes/DoomOne.itermcolors' 'Custom Color Presets':'Atom'" ~/Library/Preferences/com.googlecode.iTerm2.plist
