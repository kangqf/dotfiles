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

if [[ ! -f $HOME/.tmux.conf ]]; then
  cp $DOTPATH/etc/tmux.conf $HOME/.tmux.conf
  echo ${GREEN}✔${RESET} "Add tmux configuration file"
fi

# if [[ ! -f "$HOME/Library/Fonts/Droid Sans Mono for Powerline Nerd Font Complete.otf" ]]; then
#   cd ~/Library/Fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
#   echo ${GREEN}✔${RESET} "Droid Sans Mono"
# fi


# 退出时不显示提示
defaults write com.googlecode.iterm2 PromptOnQuit -bool false

# 自定义字体
# /usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Normal Font' DroidSansMonoNerdFont-Book 14" ~/Library/Preferences/com.googlecode.iTerm2.plist
# /usr/libexec/PlistBuddy -c "Set 'New Bookmarks':0:'Non Ascii Font' DroidSansMonoNerdFont-Book 14" ~/Library/Preferences/com.googlecode.iTerm2.plist

# 导入主题
/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'Doom One' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$HOME/.config/dotfiles/etc/item2/DoomOne.itermcolors' 'Custom Color Presets':'Doom One'" ~/Library/Preferences/com.googlecode.iTerm2.plist
echo ${GREEN}✔${RESET} "Doom One Theme"

/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'GitHub Dark' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$HOME/.config/dotfiles/etc/item2/GitHubDark.itermcolors' 'Custom Color Presets':'GitHub Dark'" ~/Library/Preferences/com.googlecode.iTerm2.plist
echo ${GREEN}✔${RESET} "GitHub Dark Theme"

/usr/libexec/PlistBuddy -c "Add 'Custom Color Presets':'Gruvbox Dark' dict" ~/Library/Preferences/com.googlecode.iTerm2.plist
/usr/libexec/PlistBuddy -c "Merge '$HOME/.config/dotfiles/etc/item2/GruvboxDark.itermcolors' 'Custom Color Presets':'Gruvbox Dark'" ~/Library/Preferences/com.googlecode.iTerm2.plist
echo ${GREEN}✔${RESET} "Gruvbox Dark Theme"
