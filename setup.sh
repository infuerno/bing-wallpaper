#!/usr/bin/env bash

ln -s $HOME/Projects/bing-wallpaper/Tools/Bing\ Wallpaper.app $HOME/Applications
mkdir -p $HOME/Library/LaunchAgents
ln -s $HOME/Projects/bing-wallpaper/Tools/com.ideasftw.bing-wallpaper.plist $HOME/Library/LaunchAgents
launchctl load $HOME/Library/LaunchAgents/com.ideasftw.bing-wallpaper.plist
brew install terminal-notifier
