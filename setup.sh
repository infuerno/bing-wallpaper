#!/usr/bin/env bash

brew install terminal-notifier
mkdir -p $HOME/Library/LaunchAgents
ln -s $HOME/Projects/bing-wallpaper/Tools/com.ideasftw.bing-wallpaper.plist $HOME/Library/LaunchAgents
launchctl load $HOME/Library/LaunchAgents/com.ideasftw.bing-wallpaper.plist
