#!/bin/sh
#
# uninstall zsh

echo "Begin uninstall zsh"

rm -rf $HOME/.oh-my-zsh
rm -rf $HOME/.zshenv
rm -rf $HOME/.zshrc

echo "uninstall zsh success."
